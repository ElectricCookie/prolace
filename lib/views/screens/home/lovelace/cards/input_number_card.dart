import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/lovelace.dart';
import 'package:home_portal/views/screens/home/home_model.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../icons.dart';

class InputNumberCard extends HookViewModelWidget<HomeModel> {
  final LovelaceCard card;
  const InputNumberCard(this.card, {super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, HomeModel viewModel) {
    var state = viewModel.getEntityState(card.entity);
    var attributes = viewModel.getEntityAttributes(card.entity);

    var initialValue = double.tryParse(state ?? "0.0") ?? 0.0;

    var number = useState<double>(initialValue);

    useEffect(() {
      number.value = initialValue;
      return null;
    }, [initialValue]);

    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 16,
            foregroundColor: Colors.grey.shade400,
            child: Icon(
              getIcon(attributes["icon"] ?? ""),
              size: 16,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(viewModel.getEntityName(card.entity) ?? "",
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis),
              Text(
                number.value.toStringAsFixed(1),
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ))
        ],
      ),
    ));
  }
}
