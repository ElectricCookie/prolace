import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/icons.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../home_model.dart';

class TimerBarCard extends StackedHookView<HomeModel> {
  final LovelaceCard card;
  final bool onScreenSaver;
  const TimerBarCard(this.card, {super.key, this.onScreenSaver = false});

  Duration parseDuration(String duration) {
    var parts = duration.split(":");
    var hours = int.parse(parts[0]);
    var minutes = int.parse(parts[1]);
    var seconds = int.parse(parts[2]);
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  String leadingZero(int value) {
    if (value < 10) {
      return "0$value";
    }
    return value.toString();
  }

  String formatDuration(Duration duration) {
    return "${leadingZero(duration.inHours)}"
        ":${leadingZero(duration.inMinutes.remainder(60))}"
        ":${leadingZero(duration.inSeconds.remainder(60))}";
  }

  @override
  builder(BuildContext context, HomeModel viewModel) {
    var attributes = viewModel.getEntityAttributes(card.entity);
    var state = viewModel.getEntityState(card.entity);
    var domain = card.entity?.split(".").first;

    final finishesAt = attributes["finishes_at"] == null
        ? DateTime(0)
        : DateTime.parse(attributes["finishes_at"]);
    final duration = parseDuration(attributes["duration"] ?? "00:00:00");

    final remaining = finishesAt.difference(DateTime.now());

    final progress =
        (duration.inSeconds - remaining.inSeconds) / duration.inSeconds;

    final timerState = useState(0);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        timerState.value = timer.tick;
      });

      return () {
        timer.cancel();
      };
    }, []);

    return BaseCard(
        isOn: state == "active",
        onColor: Colors.blue,
        iconProgress: progress,
        icon: getIcon(card.icon ?? "",
            entity: viewModel.getEntityById(card.entity!)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(viewModel.getEntityName(card.entity) ?? "",
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis),
            Text(
                "${formatDuration(remaining)} - ${(progress * 100).toStringAsFixed(2)}%"),
          ],
        ));
  }
}
