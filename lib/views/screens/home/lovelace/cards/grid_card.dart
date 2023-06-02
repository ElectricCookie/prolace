import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/lovelace/card.dart';
import 'package:stacked/stacked.dart';
import 'package:collection/collection.dart';

import '../../home_model.dart';

class GridCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const GridCard(this.card, {super.key});

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    var columns = List<List<Widget>>.generate(card.columns ?? 2, (index) => []);

    card.cards?.forEachIndexed((index, e) {
      var column = index % (card.columns ?? 2);
      columns[column].add(CardView(e));
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          columns.map((e) => Expanded(child: Column(children: e))).toList(),
    );
  }
}
