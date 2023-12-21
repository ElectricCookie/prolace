import 'package:flutter/material.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/icons.dart';
import 'package:stacked/stacked.dart';

import '../../../../../services/hass/models/lovelace.dart';

class LockCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const LockCard(this.card, {super.key});

  @override
  Widget build(BuildContext context, HomeModel model) {
    final state = model.getEntityState(card.entity);
    return BaseCard(
      isOn: state == "locked",
      onColor: Colors.green.shade400,
      offColor: Colors.red.shade400,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Lock"),
                  content: Icon(
                    getIcon(card.icon,
                        entity: model.getEntityById(card.entity!)),
                    size: 128,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          model.lock(card.entity!);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel")),
                    if (state != "locked")
                      TextButton(
                          onPressed: () {
                            model.lock(card.entity!);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Lock"))
                    else
                      TextButton(
                          onPressed: () {
                            model.unlock(card.entity!);
                            Navigator.of(context).pop();
                          },
                          child: const Text("Unlock")),
                  ],
                ));
      },
      card: card,
      title: Text(model.getEntityName(card.entity) ?? ""),
      subtitle: Text(model.getStateName(card.entity!)),
    );
  }
}
