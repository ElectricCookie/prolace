import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/entity.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/hass/hass_service.dart';
import '../../../services/hass/models/lovelace.dart';

class MirrorModel extends ReactiveViewModel {
  final _hassService = locator<HassService>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_hassService];

  List<LovelaceView> get views => _hassService.lovelaceViews;

  bool get ready => _hassService.ready;

  String get date {
    final weekdays = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];

    var now = DateTime.now();
    return "${weekdays[now.weekday]} ${now.day}.${now.month}.${now.year}";
  }

  void showSettings() {
    _navigationService.navigateTo(Routes.settingsView);
  }

  // Get currently active lights

  List<Entity> get activeLights {
    return _hassService.entities
        .where(
          (element) =>
              element.entityId!.startsWith("light") &&
              _hassService.state[element.entityId]?.state == "on",
        )
        .toList();
  }

  String get outsideTemperature {
    var state = _hassService.state["sensor.outside_multisensor_temperature_2"];
    if (state != null) {
      return state.state;
    }
    return "?";
  }

  String get lightStatus {
    final lightsActiveCount = activeLights.length;

    if (lightsActiveCount == 0) {
      return "No lights on";
    } else if (lightsActiveCount == 1) {
      return "1 light on";
    } else {
      return "$lightsActiveCount lights on";
    }
  }

  String get outsideHumidity {
    var state = _hassService.state["sensor.outside_multisensor_humidity_2"];
    if (state != null) {
      return state.state;
    }
    return "?";
  }

  String get powerNow {
    var state = _hassService.state["sensor.power_libellenweg_4"];
    if (state != null) {
      return state.state;
    }
    return "?";
  }

  String get lockState {
    var state = _hassService.state["lock.nuki_front_door_lock"];
    if (state != null) {
      return state.state == "locked" ? "Locked" : "Unlocked";
    }
    return "?";
  }
}
