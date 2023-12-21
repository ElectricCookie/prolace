import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/card.dart';
import 'package:stacked/stacked.dart';

class ConditionalCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const ConditionalCard(this.card, {super.key});

  bool conditionApplies(HomeModel viewModel) {
    if (card.conditions == null) return true;

    for (var condition in card.conditions!) {
      if (condition.entity != null) {
        var state = viewModel.getEntityState(condition.entity);
        if (condition.state != null) {
          if (condition.state is List<String>) {
            if (!(condition.state as List<String>).contains(state)) {
              return false;
            }
          } else if (condition.state is String) {
            if (condition.state != state) {
              return false;
            }
          }
        }
        if (condition.stateNot != null) {
          if (condition.stateNot is List<String>) {
            if ((condition.stateNot as List<String>).contains(state)) {
              return false;
            }
          } else if (condition.stateNot is String) {
            if (condition.stateNot == state) {
              return false;
            }
          }
        }
      }
    }

    return true;
  }

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    return AnimatedSize(
        duration: const Duration(milliseconds: 200),
        child: (conditionApplies(viewModel) && card.card != null)
            ? CardView(card.card!)
            : Container());
  }
}
