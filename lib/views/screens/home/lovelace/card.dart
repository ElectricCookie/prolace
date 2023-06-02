import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';

import 'cards/entity_card.dart';
import 'cards/grid_card.dart';
import 'cards/horizontal_stack_card.dart';
import 'cards/light_card.dart';
import 'cards/title_card.dart';
import 'lovelace_page.dart';

class CardView extends StatelessWidget {
  final LovelaceCard card;
  final bool onScreenSaver;

  const CardView(this.card, {super.key, this.onScreenSaver = false});

  @override
  Widget build(BuildContext context) {
    switch (card.type) {
      case "grid":
        return GridCard(card);
      case "entities":
        return EntitiesCard(
          card,
        );
      case "horizontal-stack":
        return HorizontalStackCard(card);
      case "custom:mushroom-entity-card":
        return EntityCard(
          card,
          onScreenSaver: onScreenSaver,
        );
      case "custom:mushroom-title-card":
        return TitleCard(card);
      case "custom:mushroom-light-card":
        return LightCard(card);
      case "custom:mushroom-chips-card":
        return ChipsCard(card);
      case "custom:mushroom-media-player-card":
        return MediaPlayerCard(card);
      case "custom:gap-card":
        return const SizedBox(
          height: 16,
        );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Unknown card type: ${card.type}"),
    );
  }
}
