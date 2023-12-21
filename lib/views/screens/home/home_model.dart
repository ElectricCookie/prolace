import 'dart:async';
import 'dart:io';

import 'package:all_sensors/all_sensors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_portal/services/hass/data/en.dart';
import 'package:home_portal/services/hass/hass_service.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:screen_brightness/screen_brightness.dart';

import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import 'package:collection/collection.dart';
import '../../../services/hass/models/entity.dart';
import '../../../services/hass/models/states.dart';

class HomeModel extends ReactiveViewModel {
  final HassService _hassService = locator<HassService>();
  final SettingsService _settingsService = locator<SettingsService>();

  List<String> get screenSaverEntities => _settingsService.screenSaverEntities;

  bool get allowNavigation => _settingsService.allowNavigation;

  bool get isMirror => _settingsService.pinnedView == "mirror";

  LovelaceView get pinnedView =>
      _hassService.lovelaceViews.firstWhereOrNull(
          (element) => element.path == _settingsService.pinnedView) ??
      _hassService.lovelaceViews.first;

  int proximityThreshold = 700;

  Timer? _proximityFuture;
  bool _screenOn = true;
  StreamSubscription<ProximityEvent>? proximitySub;

  Future<void> init() async {
    _hassService.init();

    if (Platform.isAndroid) {
      proximitySub = proximityEvents?.listen((ProximityEvent event) async {
        if (proximityThreshold <= event.proximity) {
          _proximityFuture?.cancel();
          _proximityFuture = null;
          if (!_screenOn) {
            _screenOn = true;
            await ScreenBrightness().setScreenBrightness(1);
            notifyListeners();
          }
        } else {
          _proximityFuture ??= Timer(const Duration(seconds: 5), () async {
            print("Dimming..");
            await ScreenBrightness().setScreenBrightness(0);
            _screenOn = false;
            notifyListeners();
          });
        }
      });
    }
  }

  void wake() {
    _screenOn = true;
    notifyListeners();
  }

  @override
  dispose() {
    super.dispose();
    proximitySub?.cancel();
  }

  Future<String> renderTemplate(String template) async {
    return _hassService.renderTemplate(template);
  }

  bool get screenOn => _screenOn;

  Future<void> toggleLight(String entityId) async {
    _hassService.callService("light", "toggle", {}, {"entity_id": entityId});
  }

  List<LovelaceView> get lovelaceViews => _hassService.lovelaceViews
      .where((element) => element.subview != true)
      .toList();

  bool get ready => _hassService.ready;

  Map<String, HassState> get state => _hassService.state;

  String? getEntityName(String? entityId) {
    var state = _hassService.state[entityId];
    if (state == null) {
      return null;
    }
    return state.attributes["friendly_name"];
  }

  Entity? getEntityById(String entityId) {
    return _hassService.entities
        .firstWhereOrNull((element) => element.entityId == entityId);
  }

  int get likelyView => _hassService.likelyView;

  void lock(String entityId) {
    _hassService.callService("lock", "lock", {}, {"entity_id": entityId});
  }

  void unlock(String entityId) {
    _hassService.callService("lock", "unlock", {}, {"entity_id": entityId});
  }

  Map<String, dynamic> getEntityAttributes(String? entityId) {
    var state = _hassService.state[entityId];
    if (state == null) {
      return {};
    }
    return state.attributes;
  }

  void pressButton(String entityId) {
    _hassService.callService("button", "press", {}, {"entity_id": entityId});
  }

  String cameraImage(String entityId) {
    return _hassService.cameraImage(entityId);
  }

  void adjustCover(String? entityId, double value) {
    _hassService.callService("cover", "set_cover_position", {
      "position": value.toInt()
    }, {
      "entity_id": entityId,
    });
  }

  void setLightColorTemperature(String? entityId, int kelvin) {
    _hassService.callService("light", "turn_on", {
      "color_temp": kelvin
    }, {
      "entity_id": entityId,
    });
  }

  void setLightColor(String? entityId, int red, int green, int blue) {
    _hassService.callService("light", "turn_on", {
      "rgb_color": [red, green, blue].map((e) => e.toInt()).toList()
    }, {
      "entity_id": entityId,
    });
  }

  void mediaPlayerPrevious(String? entityId) {
    _hassService.callService("media_player", "media_previous_track", {}, {
      "entity_id": entityId,
    });
  }

  void mediaPlayerNext(String? entityId) {
    _hassService.callService("media_player", "media_next_track", {}, {
      "entity_id": entityId,
    });
  }

  void mediaPlayerPause(String? entityId) {
    _hassService.callService("media_player", "media_pause", {}, {
      "entity_id": entityId,
    });
  }

  void mediaPlayerPlay(String? entityId) {
    _hassService.callService("media_player", "media_play", {}, {
      "entity_id": entityId,
    });
  }

  void setMediaPlayerVolume(String? entityId, double volume) {
    _hassService.callService("media_player", "volume_set", {
      "volume_level": volume
    }, {
      "entity_id": entityId,
    });
  }

  String? getEntityState(String? entityId) {
    var state = _hassService.state[entityId];
    if (state == null) {
      return null;
    }
    return state.state;
  }

  void setLightBrightness(String? entityId, double brightness) {
    _hassService.callService("light", "turn_on", {
      "brightness": brightness.toInt() * 2.5
    }, {
      "entity_id": entityId,
    });
  }

  void adjustInputNumber(String? entityId, double value) {
    _hassService.callService("input_number", "set_value", {
      "value": value
    }, {
      "entity_id": entityId,
    });
  }

  void setThermostatTemperature(String? entityId, double value) {
    _hassService.callService("climate", "set_temperature", {
      "temperature": value
    }, {
      "entity_id": entityId,
    });
  }

  void setInputSelect(String? entityId, String value) {
    _hassService.callService("input_select", "select_option", {
      "option": value
    }, {
      "entity_id": entityId,
    });
  }

  String getStateName(String entityId) {
    var state = getEntityState(entityId);

    var domain = entityId.split(".").first;

    // Dont show anything if its a scene..
    if (domain == "scene") {
      return "";
    }

    var stateLabels =
        enLocals["component"]![entityId.split(".").first]?["state"];

    var attributes = getEntityAttributes(entityId);

    String unit = attributes["unit_of_measurement"] ?? "";

    if (stateLabels != null) {
      // Get the device class
      var deviceClass =
          _hassService.state[entityId]?.attributes["device_class"];
      if (stateLabels.containsKey(deviceClass)) {
        return (stateLabels[deviceClass] as dynamic)![state ?? ""] ??
            "$state$unit";
      }
      if (stateLabels.containsKey("_")) {
        return (stateLabels["_"] as dynamic)![state ?? ""] ?? "$state$unit";
      }
    }

    return "$state $unit".trim();
  }

  Future<void> turnOnOff(String entityId, bool on) async {
    _hassService.callService(
        entityId.split(".").first, on ? "turn_on" : "turn_off", {}, {
      "entity_id": entityId,
    });
  }

  Future<void> toggleEntity(String entityId) async {
    await _hassService.callService(entityId.split(".").first, "toggle", {}, {
      "entity_id": entityId,
    });
    HapticFeedback.mediumImpact();
  }

  Future<void> updateTime(String entityId, TimeOfDay time) async {
    await _hassService.callService("input_datetime", "set_datetime", {
      "time": "${time.hour}:${time.minute}"
    }, {
      "entity_id": entityId,
    });
  }

  List<HassState> get activeLights => state.values
      .where(
          (state) => state.state == "on" && state.entityId.startsWith("light."))
      .toList();

  @override
  List<ListenableServiceMixin> get listenableServices => [_hassService];
}
