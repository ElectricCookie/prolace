import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/button.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../slider.dart';
import 'base_card.dart';

class LightCard extends HookViewModelWidget<HomeModel> {
  LovelaceCard card;
  LightCard(this.card, {super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, HomeModel model) {
    var state = model.getEntityState(card.entity);
    var attributes = model.getEntityAttributes(card.entity);
    var isOn = state == "on";

    double brightness = ((attributes["brightness"] ?? 0) / 255.0 * 100.0);

    return BaseCard(
        card: card,
        isOn: isOn,
        center: !isOn,
        onTap: () {
          if (card.entity == null) return;
          model.toggleLight(card.entity!);
        },
        iconProgress: isOn ? brightness / 100 : null,
        title: Text(model.getEntityName(card.entity) ?? ""),
        subtitle: Text(model.getStateName(card.entity!)),
        child: isOn
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomSlider(
                          value: brightness.toDouble(),
                          max: 100,
                          min: 0,
                          show: isOn,
                          onChanged: (newValue) {
                            model.setLightBrightness(card.entity!, newValue);
                          }),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (isOn &&
                        attributes["supported_color_modes"].contains("xy"))
                      CardButton(
                        icon: const Icon(Icons.color_lens),
                        onTap: () async {
                          final res = await showDialog<Color?>(
                              context: context,
                              builder: (context) =>
                                  ColorDialog(attributes, card));
                          if (res != null) {
                            model.setLightColor(
                                card.entity!, res.red, res.green, res.blue);
                          }
                        },
                      ).animate().fadeIn(delay: 300.ms),
                    if (isOn &&
                        attributes["supported_color_modes"]
                            .contains("color_temp"))
                      CardButton(
                        icon: const Icon(Icons.thermostat),
                        onTap: () async {
                          final res = await showDialog<double>(
                            context: context,
                            builder: (context) =>
                                ColorTempDialog(attributes, card),
                          );
                          if (res != null) {
                            model.setLightColorTemperature(
                                card.entity!, res.toInt());
                          }
                        },
                      ).animate().fadeIn(delay: 300.ms)
                  ],
                ),
              ])
            : null);
  }
}

class ColorDialog extends HookWidget {
  Map<String, dynamic> attributes;
  LovelaceCard card;

  ColorDialog(this.attributes, this.card, {super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final color = useState(Color.fromARGB(
      255,
      attributes["rgb_color"][0],
      attributes["rgb_color"][1],
      attributes["rgb_color"][2],
    ));

    return AlertDialog(
      title: const Text("Set color"),
      content: SizedBox(
        height: 500,
        child: ColorPicker(
            paletteType: PaletteType.hueWheel,
            enableAlpha: false,
            onColorChanged: (value) {
              color.value = value;
              //model.setLightColor(card.entity!, value);
            },
            pickerColor: color.value),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              //model.setLightColor(card.entity!, color.value);
              Navigator.pop(context, color.value);
            },
            child: const Text("OK")),
      ],
    );
  }
}

class ColorTempDialog extends HookWidget {
  Map<String, dynamic> attributes;
  LovelaceCard card;

  ColorTempDialog(this.attributes, this.card, {super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final temp = useState<double>(attributes["color_temp"].toDouble() ?? 0.0);

    final max = attributes["max_mireds"].toDouble() ?? 0.0;
    final min = attributes["min_mireds"].toDouble() ?? 0.0;

    return AlertDialog(
      title: const Text("Set color temperature"),
      content: SizedBox(
        width: 100,
        child: CustomSlider(
          gradient: LinearGradient(colors: [
            Colors.blue.shade200,
            Colors.white,
            Colors.yellow.shade400
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          value: temp.value,
          max: max,
          min: min,
          onChanged: (newValue) {
            temp.value = newValue;
            //model.setLightColorTemperature(card.entity!, newValue.toInt());
          },
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              //model.setLightColor(card.entity!, color.value);
              Navigator.pop(context, temp.value);
            },
            child: const Text("OK")),
      ],
    );
  }
}
