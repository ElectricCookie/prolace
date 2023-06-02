import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../slider.dart';

class LightCard extends HookViewModelWidget<HomeModel> {
  LovelaceCard card;
  LightCard(this.card, {super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, HomeModel viewModel) {
    var state = viewModel.getEntityState(card.entity);
    var attributes = viewModel.getEntityAttributes(card.entity);
    var isOn = state == "on";

    double brightness = ((attributes["brightness"] ?? 0) / 255.0 * 100.0);

    return Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            viewModel.toggleEntity(card.entity!);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                Row(children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                        radius: 16,
                        foregroundColor: isOn
                            ? Colors.yellow.shade800
                            : Colors.grey.shade400,
                        child: const Icon(
                          Icons.light,
                          size: 16,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: brightness != 0.0
                                ? Colors.yellow.shade800
                                : Colors.grey.shade400,
                            value: brightness / 100.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(viewModel.getEntityName(card.entity) ?? "",
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis),
                        Text(
                          isOn ? "On ${brightness.toStringAsFixed(0)}%" : "Off",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 16,
                ),
                CustomSlider(
                  value: brightness.toDouble(),
                  max: 100,
                  min: 0,
                  onChanged: (newValue) {
                    viewModel.setLightBrightness(card.entity!, newValue);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
