import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/button.dart';
import 'package:home_portal/views/screens/home/lovelace/slider.dart';
import 'package:stacked/stacked.dart';

class ThermostatCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const ThermostatCard(this.card, {super.key});

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    final attributes = viewModel.getEntityAttributes(card.entity);
    final state = viewModel.getEntityState(card.entity);

    final setPoint = attributes["temperature"] ?? 0;
    final min = attributes["min_temp"] ?? 0;
    final max = attributes["max_temp"] ?? 0;
    final current = attributes["current_temperature"] ?? 0;

    Color color = Colors.orange.shade400;

    if (setPoint > 21) {
      color = Colors.red.shade400;
    }

    if (setPoint < 20) {
      color = Colors.blue.shade400;
    }

    String subtitle = "";

    switch (state) {
      case "heat":
        color = Colors.red.shade400;
        subtitle = "Heating to $setPoint°C. Currently at $current°C";
        break;
      case "cool":
        color = Colors.blue.shade400;
        subtitle = "Cooling to $setPoint°C. Currently at $current°C";
        break;
      case "off":
        color = Colors.grey.shade400;
        subtitle = "Off";
        break;
      default:
        color = Colors.orange.shade400;

        break;
    }

    return BaseCard(
        card: card,
        isOn: state != "off" && state != "unavailable",
        onColor: state == "heat" ? color : Colors.blue.shade400,
        title: Text(
          viewModel.getEntityName(card.entity) ?? "",
        ),
        subtitle: Text(
          subtitle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state == "heat") ...[
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: CardButton(
                    label: "18°C",
                    onTap: () {
                      viewModel.setThermostatTemperature(card.entity!, 18);
                    },
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        CustomSlider(
                            color: color,
                            value: setPoint,
                            onChanged: (newTarget) {
                              viewModel.setThermostatTemperature(
                                  card.entity!, newTarget);
                            },
                            min: min,
                            max: max),
                        FractionallySizedBox(
                          widthFactor: (current - min) / (max - min),
                          child: SizedBox(
                            height: 42,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: CardButton(
                      label: "21°C",
                      onTap: () {
                        viewModel.setThermostatTemperature(card.entity!, 21);
                      },
                    ),
                  ),
                ],
              )
            ]
          ],
        ));
  }
}
