import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/slider.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class InputNumberCard extends HookViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const InputNumberCard(this.card, {super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, HomeModel model) {
    var state = model.getEntityState(card.entity);
    var attributes = model.getEntityAttributes(card.entity);

    double step = attributes["step"] ?? 1.0;

    var initialValue = double.tryParse(state ?? "0.0") ?? 0.0;

    var number = useState<double>(initialValue);

    useEffect(() {
      number.value = initialValue;
      return null;
    }, [initialValue]);

    return BaseCard(
        card: card,
        isOn: true,
        onColor: Colors.lightBlue.shade400,
        title: Text(
          model.getEntityName(card.entity) ?? "",
        ),
        subtitle: Text(
          model.getStateName(card.entity!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomSlider(
                      color: Colors.lightBlue.shade400,
                      value: number.value,
                      min: attributes["min"] ?? 0.0,
                      onChanged: (value) {
                        // Round to nearest step
                        value = (value / step).round() * step;
                        number.value = value;
                        model.adjustInputNumber(card.entity!, value);
                      },
                      max: attributes["max"] ?? 100.0),
                ),
              ],
            ),
          ],
        ));
  }
}
