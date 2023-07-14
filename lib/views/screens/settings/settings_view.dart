import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/views/screens/settings/settings_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../app/app.router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsModel>.reactive(
        viewModelBuilder: () => SettingsModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
            ),
            body: ListView(
              children: [
                const SettingsLabel(
                  Text(
                    "Screen saver",
                  ),
                ),
                ListTile(
                  title: const Text("Enable screen saver"),
                  trailing: Switch(
                    value: model.screenSaverEnabled,
                    onChanged: (value) => model.setScreenSaverEnabled(value),
                  ),
                ),
                ListTile(
                  title: const Text("Screen saver entities"),
                  subtitle: Text(model.screenSaverEntities.isEmpty
                      ? "None"
                      : model.screenSaverEntities.join(", ")),
                  onTap: () async {
                    var newEntities = await Navigator.of(context).pushNamed(
                        Routes.entitySelectorView,
                        arguments: EntitySelectorViewArguments(
                            selected: model.screenSaverEntities.toSet()));
                    if (newEntities == null) {
                      return;
                    }
                    model.setScreenSaverEntities(newEntities as List<String>);
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                const SettingsLabel(
                  Text(
                    "Navigation",
                  ),
                ),
                ListTile(
                  title: const Text("Allow navigation"),
                  subtitle: const Text("Enables the bottom navigation bar"),
                  trailing: Switch(
                    value: model.allowNavigation,
                    onChanged: (value) => model.setAllowNavigation(value),
                  ),
                ),
                ListTile(
                  title: const Text("Pinned view"),
                  subtitle: Text(model.pinnedView == "none "
                      ? "Select.."
                      : model.pinnedView),
                  onTap: () {
                    model.onChoosePinnedView();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                const SettingsLabel(
                  Text(
                    "Connection",
                  ),
                ),
                ConnectionSettingsView(),
                const Divider(),
                ElevatedButton(
                    onPressed: model.logout, child: const Text("Logout"))
              ],
            )));
  }
}

class SettingsLabel extends StatelessWidget {
  final Text text;

  const SettingsLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.labelSmall!,
        child: text,
      ),
    );
  }
}

class ConnectionSettingsView extends HookViewModelWidget<SettingsModel> {
  const ConnectionSettingsView({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, SettingsModel viewModel) {
    final internalUrlController = useTextEditingController(
      text: viewModel.internalUrl,
    );
    final externalUrlController =
        useTextEditingController(text: viewModel.externalUrl);

    useEffect(() {
      internalUrlController.text = viewModel.internalUrl ?? "";
      externalUrlController.text = viewModel.externalUrl ?? "";
      return null;
    }, [viewModel.internalUrl, viewModel.externalUrl]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            keyboardType: TextInputType.url,
            decoration: const InputDecoration(labelText: "Internal URL"),
            controller: internalUrlController,
            onSubmitted: (value) {
              viewModel.setInternalUrl(value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            keyboardType: TextInputType.url,
            decoration: const InputDecoration(labelText: "External URL"),
            controller: externalUrlController,
            onSubmitted: (value) {
              viewModel.setExternalUrl(value);
            },
          ),
        ],
      ),
    );
  }
}
