import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_portal/app/app.locator.dart';
import 'package:home_portal/services/hass/hass_service.dart';
import 'package:home_portal/views/screens/home/lovelace/icons.dart';
import 'package:stacked/stacked.dart';
import 'package:collection/collection.dart';

Duration fromString(String string) {
  final split = string.split(":");

  if (split.length != 3) {
    return Duration.zero;
  }

  final hours = int.tryParse(split[0]);
  final minutes = int.tryParse(split[1]);
  final seconds = int.tryParse(split[2]);

  if (hours == null || minutes == null || seconds == null) {
    return Duration.zero;
  }

  return Duration(hours: hours, minutes: minutes, seconds: seconds);
}

enum TimerState { idle, running, paused }

class ActivitiesModel extends ReactiveViewModel {
  final _hassService = locator<HassService>();

  int activeTimer = 0;

  final timers = [
    "timer.dryer_timer",
    "timer.coffee_readey",
    "timer.coffee_timeout"
  ];

  Timer? _timer;

  bool get hasActiveTimers {
    return activeTimers > 0;
  }

  int get activeTimers {
    return timers
        .where((element) =>
            getTimerState(element) == TimerState.running ||
            getTimerState(element) == TimerState.paused)
        .length;
  }

  List<String> get activeTimerEntities {
    return timers
        .where((element) =>
            getTimerState(element) == TimerState.running ||
            getTimerState(element) == TimerState.paused)
        .toList();
  }

  Duration getTimerDurationRemaining(String entity) {
    final state = _hassService.state[entity];
    if (state == null) {
      return Duration.zero;
    }

    if (state.attributes["finishes_at"] == null) {
      return Duration.zero;
    }

    final finishesAt = DateTime.parse(state.attributes["finishes_at"]);

    if (state.state == "paused") {
      return fromString(state.attributes["remaining"]);
    }

    return finishesAt.difference(DateTime.now());
  }

  String getTimerFinishTime(String entity) {
    final state = _hassService.state[entity];
    if (state == null) {
      return "";
    }

    if (state.attributes["finishes_at"] == null) {
      return "";
    }

    final finishesAt = DateTime.parse(state.attributes["finishes_at"]);

    return "${finishesAt.hour.toString().padLeft(2, "0")}:${finishesAt.minute.toString().padLeft(2, "0")}";
  }

  String getTimerName(String entity) {
    final state = _hassService.state[entity];
    if (state == null) {
      return "";
    }

    return state.attributes["friendly_name"];
  }

  IconData getTimerIcon(String entityId) {
    final entity = _hassService.entities.firstWhereOrNull(
      (element) => element.entityId == entityId,
    );
    return getIcon(null, entity: entity);
  }

  TimerState getTimerState(String entity) {
    final state = _hassService.state[entity];
    if (state == null) {
      return TimerState.idle;
    }

    switch (state.state) {
      case "active":
        return TimerState.running;
      case "paused":
        return TimerState.paused;
      case "idle":
      default:
        return TimerState.idle;
    }
  }

  void init() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_hassService];
}
