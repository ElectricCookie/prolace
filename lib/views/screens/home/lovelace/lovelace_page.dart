import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/card.dart';
import 'package:stacked/stacked.dart';
import 'package:collection/collection.dart';

import 'drop_animation.dart';

class LovelacePage extends ViewModelWidget<HomeModel> {
  final LovelaceView view;
  const LovelacePage(this.view, {super.key});

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    const maxWidth = 650;
    final width = MediaQuery.of(context).size.width;

    double padding = 8.0;

    if (width > maxWidth) {
      padding = (width - maxWidth) / 2;
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 16),
        children: view.cards?.mapIndexed((i, e) {
              return DropAnimation(
                delay: Duration(milliseconds: 20 * i),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CardView(e),
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }
}
