import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/views/screens/settings/settings_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../app/app.router.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsModel>.reactive(
        viewModelBuilder: () => SettingsModel(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Settings"),
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              children: [
                Text(
                  "Screen saver",
                  style: Theme.of(context).textTheme.caption,
                ),
                ListTile(
                  title: Text("Enable screen saver"),
                  trailing: Switch(
                    value: model.screenSaverEnabled,
                    onChanged: (value) => model.setScreenSaverEnabled(value),
                  ),
                ),
                ListTile(
                  title: Text("Screen saver entities"),
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
                ),
                Divider(),
                ConnectionSettingsView()
              ],
            )));
  }
}

class ConnectionSettingsView extends HookViewModelWidget<SettingsModel> {
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
    }, [viewModel.internalUrl, viewModel.externalUrl]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Connection",
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          keyboardType: TextInputType.url,
          decoration: InputDecoration(labelText: "Internal URL"),
          controller: internalUrlController,
          onSubmitted: (value) {
            viewModel.setInternalUrl(value);
          },
        ),
        SizedBox(
          height: 16,
        ),
        TextField(
          keyboardType: TextInputType.url,
          decoration: InputDecoration(labelText: "External URL"),
          controller: externalUrlController,
          onSubmitted: (value) {
            viewModel.setExternalUrl(value);
          },
        ),
      ],
    );
  }
}
