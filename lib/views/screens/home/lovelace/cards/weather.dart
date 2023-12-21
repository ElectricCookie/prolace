import 'dart:math';

import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/colors.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked/stacked.dart';

class WeatherCard extends ViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const WeatherCard(this.card, {super.key});

  Widget buildWeatherIcon(String condition) {
    switch (condition) {
      case "clear-night":
        return const Icon(MdiIcons.weatherNight);
      case "cloudy":
        return const Icon(MdiIcons.weatherCloudy);
      case "fog":
        return const Icon(MdiIcons.weatherFog);
      case "hail":
        return const Icon(MdiIcons.weatherHail);
      case "lightning":
        return const Icon(MdiIcons.weatherLightning);
      case "lightning-rainy":
        return const Icon(MdiIcons.weatherLightningRainy);
      case "partlycloudy":
        return const Icon(MdiIcons.weatherPartlyCloudy);
      case "pouring":
        return const Icon(MdiIcons.weatherPouring);
      case "rainy":
        return const Icon(MdiIcons.weatherRainy);
      case "snowy":
        return const Icon(MdiIcons.weatherSnowy);
      case "snowy-rainy":
        return const Icon(MdiIcons.weatherSnowyRainy);
      case "sunny":
        return const Icon(MdiIcons.weatherSunny);
      case "windy":
        return const Icon(MdiIcons.weatherWindy);
      case "windy-variant":
        return const Icon(MdiIcons.weatherWindyVariant);
      default:
        return const Icon(MdiIcons.weatherCloudy);
    }
  }

  Color conditionColor(String condition) {
    switch (condition) {
      case "clear-night":
        return Colors.blue.shade400;
      case "cloudy":
        return Colors.grey.shade400;
      case "fog":
        return Colors.blue.shade200;
      case "hail":
        return Colors.grey.shade400;
      case "lightning":
        return Colors.grey.shade400;
      case "lightning-rainy":
        return Colors.grey.shade400;
      case "partlycloudy":
        return Colors.grey.shade400;
      case "pouring":
        return Colors.blue.shade400;
      case "rainy":
        return Colors.blue.shade400;
      case "snowy":
        return Colors.grey.shade400;
      case "snowy-rainy":
        return Colors.grey.shade400;
      case "sunny":
        return Colors.yellow.shade400;
      case "windy":
        return Colors.grey.shade400;
      case "windy-variant":
        return Colors.grey.shade400;
      default:
        return Colors.grey.shade400;
    }
  }

  String weekday(String datetime) {
    final weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final date = DateTime.parse(datetime);
    return weekdays[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context, HomeModel viewModel) {
    final attributes = viewModel.getEntityAttributes(card.entity);

    final tempUnit = attributes["temperature_unit"] ?? "°C";

    String current = viewModel.getStateName(card.entity!);

    bool willRain = false;

    final forecast = attributes["forecast"] ?? [];

    for (var forecast in forecast) {
      if (forecast["condition"] == "rainy") {
        willRain = true;
        break;
      }
    }

    return BaseCard(
      isOn: true,
      onColor:
          conditionColor(viewModel.getEntityState(card.entity!) ?? "cloudy"),
      card: card,
      title: Text(
        current,
        maxLines: 5,
      ),
      subtitle: Text(
          "Now ${attributes["temperature"]}, ${attributes["temperature_unit"]} ${attributes["humidity"]}% humidity${willRain ? ". It will rain today" : ""}"),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          children: [
            Divider(
              color: borderColor(context),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
                children: forecast
                    .sublist(0, min<int>(forecast.length, 5))
                    .map<Widget>((item) {
              return Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          conditionColor(item["condition"]).withAlpha(50),
                      child: IconTheme(
                        data: IconThemeData(
                            color: conditionColor(item["condition"]), size: 18),
                        child: buildWeatherIcon(item["condition"]),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(weekday(item["datetime"])),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${item["temperature"]}$tempUnit",
                    ),
                    Text(
                      "${item["templow"]}$tempUnit",
                      style:
                          TextStyle(fontSize: 12, color: mutedColor(context)),
                    ),
                  ],
                ),
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
