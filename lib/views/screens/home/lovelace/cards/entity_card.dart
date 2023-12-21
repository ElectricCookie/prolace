import 'package:flutter/material.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/lock_card.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/thermostat.dart';
import 'package:stacked/stacked.dart';

import '../../../../../services/hass/models/lovelace.dart';

import '../../home_model.dart';

import 'input_date_time_card.dart';
import 'input_number_card.dart';

class EntityCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  final bool onScreenSaver;
  const EntityCard(this.card, {super.key, this.onScreenSaver = false});

  @override
  build(BuildContext context, HomeModel viewModel) {
    var attributes = viewModel.getEntityAttributes(card.entity);
    var state = viewModel.getEntityState(card.entity);
    var domain = card.entity?.split(".").first;

    switch (domain) {
      case "input_number":
        return InputNumberCard(card);
      case "input_datetime":
        return InputDateTimeCard(card);
      case "lock":
        return LockCard(card);
      case "thermostat":
        return ThermostatCard(card);
      case "switch":
      case "automation":
      case "binary_sensor":
      case "sensor":
      case "scene":
      case "input_boolean":
        var isOn = state == "on";

        var subtitle = viewModel.getStateName(card.entity!);

        var color = isOn ? Colors.yellow.shade800 : Colors.grey.shade400;

        if (domain == "sensor") {
          color = Colors.blue.shade400;
        }

        if (domain == "scene") {
          color = Colors.green.shade400;
        }

        if (domain == "switch") {
          color = Colors.blue.shade400;
        }

        return BaseCard(
          onColor: color,
          isOn: isOn,
          onTap: () => viewModel.toggleEntity(card.entity!),
          card: card,
          title: Text(viewModel.getEntityName(card.entity) ?? ""),
          subtitle: Text(subtitle),
        );
    }

    return Text("Unknown entity type: ${card.entity}");
  }
}
