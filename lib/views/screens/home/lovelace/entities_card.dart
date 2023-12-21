import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class EntitiesCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const EntitiesCard(this.card, {super.key});
  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    return BaseCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
            children: card.entities?.map((e) => EntityItem(e)).toList() ?? []),
      ),
    );
  }
}

class EntityItem extends StackedHookView<HomeModel> {
  final dynamic entity;
  const EntityItem(this.entity, {super.key});
  @override
  Widget builder(BuildContext context, HomeModel model) {
    final entityId = entity is String ? entity : entity["entity"];

    final name = Text(model.getEntityName(entityId) ?? "");
    final state = Text(model.getEntityState(entityId) ?? "");

    switch (entityId.split(".").first) {
      case "button":
        return Row(
          children: [
            Expanded(child: name),
            OutlinedButton(
              child: const Text("Press"),
              onPressed: () {
                model.pressButton(entityId);
              },
            ),
          ],
        );
      case "light":
        return SwitchListTile(
            title: Text(model.getEntityName(entityId) ?? ""),
            value: model.getEntityState(entityId) == "on",
            onChanged: (e) {
              model.turnOnOff(entityId, e);
            });
      case "sensor":
      case "binary_sensor":
        return ListTile(
            title: Text(model.getEntityName(entityId) ?? ""),
            trailing: Text(model.getStateName(entityId)));

      default:
        return ListTile(
          title: Text(model.getEntityName(entityId) ?? ""),
          trailing: Text(model.getEntityState(entityId) ?? ""),
        );
    }
  }
}
