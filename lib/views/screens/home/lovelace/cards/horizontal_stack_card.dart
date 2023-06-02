import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/card.dart';
import 'package:stacked/stacked.dart';

class HorizontalStackCard extends ViewModelWidget<HomeModel> {
  LovelaceCard card;
  HorizontalStackCard(this.card, {super.key});

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    return IntrinsicHeight(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
          card.cards?.map((e) => Expanded(child: CardView(e))).toList() ?? [],
    ));
  }
}
