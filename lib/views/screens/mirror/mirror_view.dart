import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 64, fontWeight: FontWeight.bold),
                        child: TimeView()),
                    const SizedBox(height: 4),
                    Text(viewModel.date, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(
                            label: Text(viewModel.lightStatus),
                            avatar: const Icon(Icons.light)),
                        Chip(
                            label: Text(
                                "${viewModel.outsideTemperature}°C outside"),
                            avatar: const Icon(Icons.thermostat)),
                        Chip(
                            label:
                                Text("${viewModel.outsideHumidity}%  outside"),
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
                    LightView(
                      lights: viewModel.activeLights,
                    )
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
    required this.animation,
    required this.item,
  });

  final Animation<double> animation;
  final VoidCallback? onTap;
  final Entity item;

  final bool removing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ScaleTransition(
        scale: CurvedAnimation(
            parent: animation,
            curve: removing ? Curves.easeInOut : Curves.easeIn),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            child: Card(
              color: Colors.white.withAlpha(230),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.light,
                          size: 32, color: Colors.yellow.shade800),
                      const SizedBox(height: 8),
                      Text(
                        '${item.name}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LightView extends StatefulWidget {
  final List<Entity> lights;

  const LightView({super.key, required this.lights});

  @override
  State<LightView> createState() => _LightViewState();
}

class _LightViewState extends State<LightView> {
  var gridKey = GlobalKey<AnimatedGridState>();

  @override
  void didUpdateWidget(covariant LightView oldWidget) {
    var removedLights = oldWidget.lights
        .where((element) => !widget.lights.contains(element))
        .toList();

    // Remove lights
    for (var element in removedLights) {
      var index = oldWidget.lights.indexOf(element);
      gridKey.currentState?.removeItem(
        index,
        (context, animation) {
          return CardItem(
            animation: animation,
            item: element,
            removing: true,
          );
        },
        duration: const Duration(milliseconds: 500),
      );
    }

    // Added lights

    var addedLights = widget.lights
        .where((element) => !oldWidget.lights.contains(element))
        .toList();

    // Add lights
    for (var element in addedLights) {
      gridKey.currentState?.insertItem(oldWidget.lights.length,
          duration: const Duration(milliseconds: 500));
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AnimatedGrid(
          itemBuilder: (context, n, animation) {
            return CardItem(
                animation: animation, item: widget.lights.elementAt(n));
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          initialItemCount: widget.lights.length,
          key: gridKey),
    );
  }
}
