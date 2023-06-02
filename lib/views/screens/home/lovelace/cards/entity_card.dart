import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../services/hass/models/lovelace.dart';

import '../../home_model.dart';

import '../icons.dart';
import 'input_date_time_card.dart';
import 'input_number_card.dart';

class EntityCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  final bool onScreenSaver;
  EntityCard(this.card, {super.key, this.onScreenSaver = false});

  @override
  build(BuildContext context, HomeModel viewModel) {
    var attributes = viewModel.getEntityAttributes(card.entity);
    var state = viewModel.getEntityState(card.entity);
    var domain = card.entity?.split(".").first;

    print(card);

    switch (domain) {
      case "input_number":
        return InputNumberCard(card);
      case "input_datetime":
        return InputDateTimeCard(card);
      case "switch":
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

        return Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              onTap: () {
                viewModel.toggleEntity(card.entity!);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      radius: 16,
                      foregroundColor: color,
                      child: Icon(
                        getIcon(attributes["icon"] ?? "",
                            entity: viewModel.getEntityById(card.entity!)),
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.getEntityName(card.entity) ?? "",
                            style: onScreenSaver
                                ? Theme.of(context).textTheme.caption
                                : Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (subtitle.isNotEmpty)
                            Text(
                              subtitle,
                              style: onScreenSaver
                                  ? Theme.of(context).textTheme.bodyLarge
                                  : Theme.of(context).textTheme.caption,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
    }

    return Text("Unknown entity type: ${card.entity}");
  }
}
