import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/hass/hass_service.dart';
import '../../../services/hass/models/entity.dart';

class EntitySelectorModel extends ReactiveViewModel {
  Set<String> selected;

  EntitySelectorModel({required this.selected});

  @override
  List<ListenableServiceMixin> get listenableServices => [_hassService];

  final _hassService = locator<HassService>();

  List<Entity> get entities => _hassService.entities;

  bool _showOnlySelected = false;
  bool get showOnlySelected => _showOnlySelected;

  void toggleShowOnlySelected() {
    _showOnlySelected = !_showOnlySelected;
    notifyListeners();
  }

  int get entityCount => _showOnlySelected ? selected.length : entities.length;

  Entity getEntity(int index) {
    if (_showOnlySelected) {
      return entities
          .where((e) => selected.contains(e.entityId))
          .elementAt(index);
    } else {
      return entities.elementAt(index);
    }
  }

  void select(String entity) {
    if (selected.contains(entity)) {
      selected.remove(entity);
    } else {
      selected.add(entity);
    }
    notifyListeners();
  }
}

class EntitySelectorView extends StatelessWidget {
  Set<String> selected;

  EntitySelectorView({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EntitySelectorModel>.reactive(
        viewModelBuilder: () => EntitySelectorModel(selected: selected),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () =>
                      Navigator.of(context).pop(model.selected.toList()),
                ),
                actions: [
                  if (model.showOnlySelected)
                    IconButton(
                      icon: const Icon(Icons.check_box),
                      onPressed: () => model.toggleShowOnlySelected(),
                    ),
                  if (!model.showOnlySelected)
                    IconButton(
                      icon: const Icon(Icons.check_box_outline_blank),
                      onPressed: () => model.toggleShowOnlySelected(),
                    ),
                ],
                title: const Text("Select entities")),
            body: ListView.builder(
                itemCount: model.entityCount,
                itemBuilder: ((context, index) {
                  var entity = model.getEntity(index);
                  return CheckboxListTile(
                    title: Text(entity.name ?? "Unknown"),
                    subtitle: Text(entity.entityId ?? "no entity id"),
                    value: model.selected.contains(entity.entityId),
                    onChanged: (value) {
                      model.select(entity.entityId!);
                    },
                  );
                })),
          );
        });
  }
}
