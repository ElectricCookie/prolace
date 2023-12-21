import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/cover.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/picture.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/select_card.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/template.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/vacuum.dart';
import 'package:home_portal/views/screens/home/lovelace/chips_card.dart';
import 'package:home_portal/views/screens/home/lovelace/entities_card.dart';

import 'cards/conditional.dart';
import 'cards/entity_card.dart';
import 'cards/grid_card.dart';
import 'cards/horizontal_stack_card.dart';
import 'cards/input_number_card.dart';
import 'cards/light_card.dart';
import 'cards/media_player.dart';
import 'cards/thermostat.dart';
import 'cards/timer_bar.dart';
import 'cards/title_card.dart';
import 'cards/weather.dart';

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
      case "picture-entity":
        return PictureEntityCard(card);
      case "custom:xiaomi-vacuum-map-card":
        return VacuumCard(card);
      case "custom:mushroom-template-card":
        return TemplateCard(card);
      case "custom:timer-bar-card":
        return TimerBarCard(card);
      case "conditional":
        return ConditionalCard(card);
      case "custom:mushroom-number-card":
        return InputNumberCard(card);
      case "horizontal-stack":
        return HorizontalStackCard(card);
      case "custom:mushroom-select-card":
        return SelectCard(card);
      case "weather-forecast":
        return WeatherCard(card);
      case "thermostat":
      case "custom:mushroom-climate-card":
        return ThermostatCard(card);
      case "custom:mushroom-cover-card":
        return CoverCard(card);
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
