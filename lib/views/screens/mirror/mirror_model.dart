import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/entity.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
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
}
