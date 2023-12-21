import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';

class TitleCard extends StatelessWidget {
  final LovelaceCard card;

  const TitleCard(this.card, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        card.title ?? "",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
