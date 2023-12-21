import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/services/hass/models/states.dart';
import 'package:http/http.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:web_socket_channel/io.dart';

import '../../app/app.locator.dart';
import '../auth/auth.dart';
import '../settings/settings_service.dart';
import 'message.dart';
import 'models/entity.dart';

class HassService with ListenableServiceMixin {
  // Settings service
  final SettingsService _settingsService = locator<SettingsService>();
  final AuthService _authService = locator<AuthService>();

  final ReactiveValue<bool> _ready = ReactiveValue(false);
  bool get ready => _ready.value;

  final Map<String, HassState> _state = <String, HassState>{};

  Map<String, HassState> get state => _state;

  List<Entity> _entities = <Entity>[];
  List<Entity> get entities => _entities;

  final List<LovelaceView> _lovelaceViews = <LovelaceView>[];
  List<LovelaceView> get lovelaceViews => _lovelaceViews;

  int messageCount = 2;

  int get likelyView => getLikeleyRoom();

  final Map<int, Completer<Message>> _completers = {};

  HassService() {
    listenToReactiveValues([_ready]);
  }

  IOWebSocketChannel? _channel;

  Future<bool> shouldUseExternalUrl() async {
    if (_settingsService.externalUrl == null) {
      return false;
    }

    if (await Permission.locationWhenInUse.isLimited ||
        await Permission.locationWhenInUse.isRestricted ||
        await Permission.locationWhenInUse.isPermanentlyDenied ||
        await Permission.locationWhenInUse.isDenied) {
      await Permission.locationWhenInUse.request();
    }

    final info = NetworkInfo();

    final wifiName = await info.getWifiName();

    if (wifiName == null) {
      return true;
    }

    if (_settingsService.internalSsids.contains(wifiName)) {
      return false;
    }

    return true;
  }

  Future<String?> urlWs() async {
    if (await shouldUseExternalUrl()) {
      return _settingsService.externalUrl
          ?.replaceAll("http://", "ws://")
          .replaceAll("https://", "wss://");
    }

    return _settingsService.internalUrl
        ?.replaceAll("http://", "ws://")
        .replaceAll("https://", "wss://");
  }

  String? get url {
    return _settingsService.internalUrl;
  }

  String cameraImage(String entityId) {
    final state = _state[entityId];
    final accessToken = state?.attributes["access_token"];

    return "$url/api/camera_proxy/$entityId?token=$accessToken";
  }

  // Initialize the service
  void init() async {
    shouldUseExternalUrl();

    final wsUrl = await urlWs();

    if (wsUrl == null) {
      return;
    }

    print(wsUrl);

    try {
      _channel = IOWebSocketChannel.connect(Uri.parse("$wsUrl/api/websocket"));

      _channel!.stream.listen((event) async {
        // Handle the event
        var data = jsonDecode(event as String);

        var message = Message.fromJson(data);

        switch (message.type) {
          case "auth_required":
            _channel?.sink.add(jsonEncode(Message(
                    type: "auth",
                    accessToken: _authService.hasLongLivedToken
                        ? _authService.longLivedToken
                        : _authService.accessToken)
                .toJson()
              ..removeWhere((key, value) => value == null)));
            break;
          case "auth_ok":
            send(Message(type: "subscribe_events", eventType: "state_changed"));

            var states = await send(Message(type: "get_states"));

            (states.result as List<dynamic>?)?.forEach((state) {
              var itemState = HassState.fromJson(state);
              _state[itemState.entityId] = itemState;
            });

            var lovelace = await send(Message(type: "lovelace/config"));

            if (lovelace.result != null) {
              lovelaceViews.clear();

              lovelace.result["views"]?.forEach((view) {
                _lovelaceViews.add(LovelaceView.fromJson(view));
              });
            }

            var entities =
                await send(Message(type: "config/entity_registry/list"));

            _entities = entities.result
                .map<Entity>((entity) => Entity.fromJson(entity))
                .toList();

            _entities.sort((a, b) {
              if (a.name != null && b.name == null) {
                return -1;
              }
              if (a.name == null && b.name != null) {
                return 1;
              }
              if (a.name != null && b.name != null) {
                return a.name!.compareTo(b.name!);
              }
              if (a.entityId != null && b.entityId != null) {
                return a.entityId!.compareTo(b.entityId!);
              }

              return 0;
            });

            _ready.value = true;

            notifyListeners();

            break;
          case "event":
            if (message.event?.eventType == "state_changed") {
              var entity = message.event?.data?.entityId;

              if (entity != null && message.event?.data?.newState != null) {
                _state[entity] = message.event!.data!.newState!;
                notifyListeners();
              }
            }

            break;

          default:
            if (message.id != null) {
              var completer = _completers[message.id];
              if (completer != null) {
                completer.complete(message);
                _completers.remove(message.id);
              }
            }
            break;
        }
      }, onDone: _wsDone, onError: _wsError, cancelOnError: true);
    } catch (e) {
      _wsError(e);
    }
  }

  void _wsDone() {
    _ready.value = false;

    Future.delayed(const Duration(seconds: 1), () {
      init();
    });

    print("WebSocket closed");
  }

  void _wsError(error) {
    _ready.value = false;
    print("WebSocket error: $error");
    Future.delayed(const Duration(seconds: 1), () {
      init();
    });
  }

  int getLikeleyRoom() {
    HassState? likelyRoom;
    DateTime likelyRoomChanged = DateTime(0);

    for (var element in state.entries) {
      var itemState = element.value;
      if (itemState.attributes["device_class"] == "motion" &&
          itemState.state == "on") {
        // If this sensor has a more recent change time than the current one make it the likely room
        if (DateTime.parse(itemState.lastChanged!).isAfter(likelyRoomChanged)) {
          likelyRoom = itemState;
          likelyRoomChanged = DateTime.parse(itemState.lastChanged!);
          continue;
        }
      }
    }

    if (likelyRoom != null) {
      // Try find the appropriate lovelace view

      var entity = _entities.firstWhereOrNull(
        (element) => element.entityId == likelyRoom!.entityId,
      );

      if (entity == null) {
        return 0;
      }

      var view = lovelaceViews.indexWhere(
        (element) => viewContainsEntity(
          entity.entityId!,
          element,
        ),
      );

      if (view != -1) {
        return view;
      }
    }
    return 0;
  }

  bool viewContainsEntity(String entityId, LovelaceView view) {
    for (final card in view.cards ?? []) {
      if (card.entity == entityId) {
        return true;
      }
      if (card.chips != null) {
        for (final chip in card.chips!) {
          if (chip.entity == entityId) {
            return true;
          }
        }
      }
    }

    return false;
  }

  Future<String> renderTemplate(
    String template,
  ) async {
    final baseUrl = url;
    if (baseUrl == null) {
      return "";
    }
    final token = _authService.hasLongLivedToken
        ? _authService.longLivedToken
        : _authService.accessToken;
    final result = await post(Uri.parse("$baseUrl/api/template"),
        headers: {"Authorization": "Bearer $token"},
        body: jsonEncode({"template": template}));
    return result.body;
  }

  // Send a message to the server
  Future<Message> send(Message message) async {
    var completer = Completer<Message>();
    _completers[messageCount] = completer;
    message.id = messageCount;
    messageCount++;

    var content =
        jsonEncode(message.toJson()..removeWhere((_, value) => value == null));

    _channel?.sink.add(content);
    return completer.future;
  }

  Future<void> callService(String domain, String service,
      Map<String, dynamic> data, Map<String, dynamic> target) async {
    await send(Message(
      type: "call_service",
      serviceData: data,
      target: target,
      domain: domain,
      service: service,
    ));
  }
}
