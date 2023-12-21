import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:stacked/stacked.dart';

class InputDateTimeCard extends ViewModelWidget<HomeModel> {
  LovelaceCard card;
  InputDateTimeCard(this.card, {super.key});

  void onTap(BuildContext context, HomeModel viewModel) async {
    var attributes = viewModel.getEntityAttributes(card.entity);
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
  }

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    var state = viewModel.getEntityState(card.entity);
    return BaseCard(
      card: card,
      onTap: () => onTap(context, viewModel),
      title: Text(
        viewModel.getEntityName(card.entity) ?? "",
      ),
      subtitle: Text(state ?? ""),
    );
  }
}
