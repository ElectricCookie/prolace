import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/colors.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/icons.dart';
import 'package:stacked/stacked.dart';

class ChipsCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const ChipsCard(this.card, {super.key});

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: (card.chips ?? []).map((e) {
        if (e.type == "spacer") {
          return const Spacer();
        }

        return IntrinsicWidth(
          child: Container(
              decoration: BoxDecoration(
                  color: cardColor(context),
                  border: Border.all(color: borderColor(context)),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  Icon(
                    getIcon(e.icon ?? "",
                        entity: viewModel.getEntityById(e.entity ?? "")),
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(viewModel.getStateName(e.entity ?? ""),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ))
                ],
              )),
        );
      }).toList(),
    );
  }
}
