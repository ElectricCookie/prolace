import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/colors.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:stacked/stacked.dart';

class PictureEntityCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const PictureEntityCard(this.card, {super.key});

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    final entityId = card.entity;

    final image = viewModel.cameraImage(entityId!);

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: borderColor(context)),
          borderRadius: BorderRadius.circular(12)),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
