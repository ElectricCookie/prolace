import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:stacked/stacked.dart';

import '../../home_model.dart';

class TemplateCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  final bool onScreenSaver;
  const TemplateCard(this.card, {super.key, this.onScreenSaver = false});

  @override
  build(BuildContext context, HomeModel viewModel) {
    return BaseCard(
        card: card,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (card.primary != null && card.primary!.isNotEmpty)
              FutureBuilder<String>(
                  future: viewModel.renderTemplate(card.primary ?? ""),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  }),
            if (card.secondary != null && card.secondary!.isNotEmpty)
              FutureBuilder<String>(
                  future: viewModel.renderTemplate(card.secondary ?? ""),
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? "",
                      style: Theme.of(context).textTheme.headlineSmall,
                    );
                  })
          ],
        ));
  }
}
