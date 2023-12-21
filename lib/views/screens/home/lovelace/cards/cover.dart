import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/base_card.dart';
import 'package:home_portal/views/screens/home/lovelace/cards/button.dart';
import 'package:home_portal/views/screens/home/lovelace/icons.dart';
import 'package:home_portal/views/screens/home/lovelace/slider.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class CoverCard extends HookViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const CoverCard(this.card, {super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, HomeModel viewModel) {
    var state = viewModel.getEntityState(card.entity);
    var attributes = viewModel.getEntityAttributes(card.entity);

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
        title: Text(
          viewModel.getEntityName(card.entity) ?? "",
        ),
        subtitle: Text("${number.value.round()}% open"),
        onColor: Colors.lightBlue.shade400,
        iconProgress: number.value / 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CardButton(
                  icon: const Icon(Icons.arrow_upward),
                  onTap: () {
                    viewModel.adjustCover(card.entity!, 100);
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: CustomSlider(
                      color: Colors.lightBlue.shade400,
                      value: number.value,
                      min: attributes["min"] ?? 0.0,
                      onChanged: (value) {
                        // Round to nearest step
                        value = (value / step).round() * step;
                        number.value = value;
                        viewModel.adjustCover(card.entity!, value);
                      },
                      max: attributes["max"] ?? 100.0),
                ),
                const SizedBox(
                  width: 8,
                ),
                CardButton(
                  icon: const Icon(Icons.arrow_downward),
                  onTap: () {
                    viewModel.adjustCover(card.entity!, 0);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
