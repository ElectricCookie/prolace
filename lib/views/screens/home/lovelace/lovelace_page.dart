import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/card.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:collection/collection.dart';

import 'drop_animation.dart';
import 'icons.dart';

class LovelacePage extends ViewModelWidget<HomeModel> {
  final LovelaceView view;
  const LovelacePage(this.view);

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        children: view.cards?.mapIndexed((i, e) {
              return DropAnimation(
                delay: Duration(milliseconds: 20 * i),
                child: CardView(e),
              );
            }).toList() ??
            [],
      ),
    );
  }
}

class MediaPlayerCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const MediaPlayerCard(this.card);
  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    var isOn = false;
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 16,
            foregroundColor: isOn ? Colors.blue.shade800 : Colors.grey.shade400,
            child: const Icon(
              Icons.cast,
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
                Text(viewModel.getStateName(card.entity!)),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class EntitiesCard extends HookViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const EntitiesCard(this.card);
  @override
  Widget buildViewModelWidget(BuildContext context, HomeModel viewModel) {
    return Card(
      child: Column(
          children: card.entities?.map((e) => EntityItem(e)).toList() ?? []),
    );
  }
}

class EntityItem extends HookViewModelWidget<HomeModel> {
  final dynamic entity;
  const EntityItem(this.entity);
  @override
  Widget buildViewModelWidget(BuildContext context, HomeModel viewModel) {
    if (entity.runtimeType == String) {
      switch (entity.split(".").first) {
        case "light":
          return SwitchListTile(
              title: Text(viewModel.getEntityName(entity) ?? ""),
              value: viewModel.getEntityState(entity) == "on",
              onChanged: (e) {
                viewModel.turnOnOff(entity, e);
              });
        case "binary_sensor":
          return ListTile(
              title: Text(viewModel.getEntityName(entity) ?? ""),
              trailing: Text(viewModel.getStateName(entity)));

        case "sensor":
          return ListTile(
            title: Text(viewModel.getEntityName(entity) ?? ""),
            trailing: Text(viewModel.getEntityState(entity) ?? ""),
          );
      }
      return Text(entity);
    }
    return const Text("WtF");
  }
}

class ChipsCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const ChipsCard(this.card);

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    return Wrap(
      spacing: 8,
      children: (card.chips ?? [])
          .map((e) => Chip(
                avatar: Icon(
                  getIcon(e.icon ?? "",
                      entity: viewModel.getEntityById(e.entity ?? "")),
                  size: 16,
                ),
                label: Text(viewModel.getStateName(e.entity!)),
              ))
          .toList(),
    );
  }
}
