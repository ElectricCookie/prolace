import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/button.dart';
import 'package:home_portal/views/screens/home/lovelace/slider.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class MediaPlayerCard extends StackedHookView<HomeModel> {
  final LovelaceCard card;
  const MediaPlayerCard(this.card, {super.key});
  @override
  Widget builder(BuildContext context, HomeModel viewModel) {
    var attributes = viewModel.getEntityAttributes(card.entity);
    final volume = attributes["volume_level"] ?? 0.0;

    final state = viewModel.getEntityState(card.entity);

    return BaseCard(
        isOn: viewModel.getEntityState(card.entity) == "playing",
        onColor: Colors.green.shade400,
        card: card,
        title: Text(viewModel.getEntityName(card.entity) ?? ""),
        subtitle: Text(viewModel.getStateName(card.entity!)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state == "playing" || state == "paused") ...[
              Row(
                children: [
                  CardButton(
                      icon: const Icon(Icons.skip_previous),
                      onTap: () {
                        viewModel.mediaPlayerPrevious(card.entity!);
                      }),
                  const SizedBox(
                    width: 4,
                  ),
                  if (state == "playing")
                    CardButton(
                        icon: const Icon(Icons.pause),
                        onTap: () {
                          viewModel.mediaPlayerPause(card.entity!);
                        })
                  else
                    CardButton(
                        icon: const Icon(Icons.play_arrow),
                        onTap: () {
                          viewModel.mediaPlayerPlay(card.entity!);
                        }),
                  const SizedBox(
                    width: 4,
                  ),
                  CardButton(
                      icon: const Icon(Icons.skip_next),
                      onTap: () {
                        viewModel.mediaPlayerNext(card.entity!);
                      }),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CustomSlider(
                        color: Colors.green.shade400,
                        min: 0,
                        max: 100,
                        value: volume * 100,
                        onChanged: (newVolume) {
                          viewModel.setMediaPlayerVolume(
                              card.entity!, newVolume / 100);
                        }),
                  ),
                ],
              )
            ]
          ],
        ));
  }
}
