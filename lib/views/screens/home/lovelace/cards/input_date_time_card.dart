import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:stacked/stacked.dart';

import '../icons.dart';

class InputDateTimeCard extends ViewModelWidget<HomeModel> {
  LovelaceCard card;
  InputDateTimeCard(this.card, {super.key});
  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    var attributes = viewModel.getEntityAttributes(card.entity);
    var state = viewModel.getEntityState(card.entity);
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
          onTap: () async {
            if (attributes["editable"] == true) {
              var hasTime = attributes["has_time"] == true;
              var hasDate = attributes["has_date"] == true;

              if (!hasDate && !hasTime) {
                return;
              }
              if (!hasDate && hasTime) {
                var newTime = await showTimePicker(
                    context: context,
                    initialEntryMode: TimePickerEntryMode.input,
                    initialTime: TimeOfDay(
                        hour: attributes["hour"] ?? 0,
                        minute: attributes["minute"] ?? 0));
                if (newTime != null) {
                  viewModel.updateTime(card.entity!, newTime);
                }
              } else {}
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  radius: 16,
                  foregroundColor: state == "on"
                      ? Colors.yellow.shade800
                      : Colors.grey.shade400,
                  child: Icon(
                    getIcon(attributes["icon"] ?? ""),
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
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(state ?? ""),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
