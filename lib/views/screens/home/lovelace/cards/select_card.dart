import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:stacked/stacked.dart';

import '../../home_model.dart';
import 'base_card.dart';

class SelectCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  final bool onScreenSaver;
  const SelectCard(this.card, {super.key, this.onScreenSaver = false});

  @override
  build(BuildContext context, HomeModel viewModel) {
    var attributes = viewModel.getEntityAttributes(card.entity);
    var state = viewModel.getEntityState(card.entity);

    return BaseCard(
      card: card,
      title: Text(
        viewModel.getEntityName(card.entity) ?? "",
      ),
      subtitle: Text(viewModel.getStateName(card.entity!)),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: attributes["options"].length,
                  itemBuilder: (context, index) {
                    var option = attributes["options"][index];
                    return RadioListTile(
                      value: option,
                      groupValue: state,
                      title: Text(option),
                      onChanged: (_) {
                        viewModel.setInputSelect(card.entity, option);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              );
            });
      },
    );
  }
}
