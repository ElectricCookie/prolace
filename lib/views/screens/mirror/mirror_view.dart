import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/hass/models/states.dart';
import 'package:home_portal/views/screens/home/lovelace/time.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../services/hass/models/entity.dart';
import '../home/lovelace/icons.dart';
import 'mirror_model.dart';

class MirrorView extends StackedView<MirrorModel> {
  const MirrorView({super.key});

  @override
  Widget builder(BuildContext context, MirrorModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                viewModel.showSettings();
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Stack(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 8.0, top: MediaQuery.of(context).size.height / 4.0),
              child: ListView(children: [
                const DefaultTextStyle(
                    style:
                        TextStyle(fontSize: 128, fontWeight: FontWeight.bold),
                    child: TimeView()),
                const SizedBox(height: 4),
                Text(viewModel.date, style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(
                        label: Text(viewModel.lightStatus),
                        avatar: const Icon(Icons.light)),
                    Chip(
                        label:
                            Text("${viewModel.outsideTemperature}°C outside"),
                        avatar: const Icon(Icons.thermostat)),
                    Chip(
                        label: Text("${viewModel.outsideHumidity}%  outside"),
                        avatar: const Icon(Icons.water_drop)),
                    Chip(
                        label: Text(
                          viewModel.lockState,
                        ),
                        avatar: const Icon(Icons.lock)),
                    Chip(
                        label: Text(
                          "${viewModel.powerNow}W now",
                        ),
                        avatar: const Icon(Icons.power)),
                  ],
                ),
                const SizedBox(height: 16),
                ImplicitlyAnimatedList<Entity>(
                  items: viewModel.activeLights,
                  shrinkWrap: true,
                  areItemsTheSame: (a, b) => a.entityId == b.entityId,
                  itemBuilder: (context, animation, item, index) {
                    return SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: animation,
                        child: CardItem(
                          state: viewModel.states[item.entityId]!,
                          item: item,
                        ));
                  },
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  MirrorModel viewModelBuilder(BuildContext context) {
    return MirrorModel();
  }
}

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value.
///
/// The text is displayed in bright green if [selected] is
/// true. This widget's height is based on the [animation] parameter, it
/// varies from 0 to 128 as the animation varies from 0.0 to 1.0.
class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTap,
    this.removing = false,
    required this.item,
    required this.state,
  });

  final VoidCallback? onTap;
  final Entity item;
  final HassState state;

  final bool removing;

  @override
  Widget build(BuildContext context) {
    var brightness = state.attributes["brightness"] ?? 0;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 300,
        child: Card(
          color: Colors.white.withAlpha(200),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white.withAlpha(100),
                    child: Icon(Icons.lightbulb,
                        size: 24, color: Colors.yellow.shade800),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.name}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${(brightness / 25.0).round()}%',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
