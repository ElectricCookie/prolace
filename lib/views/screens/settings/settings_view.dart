import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:home_portal/views/screens/settings/settings_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../app/app.router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: ViewModelBuilder<SettingsModel>.reactive(
            viewModelBuilder: () => SettingsModel(),
            builder: (context, model, child) => ListView(
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
                        onChanged: (value) =>
                            model.setScreenSaverEnabled(value),
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
                        model.setScreenSaverEntities(
                            newEntities as List<String>);
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
                        "Theme",
                      ),
                    ),
                    ListTile(
                      title: const Text("Theme mode"),
                      subtitle:
                          Text(model.themeMode.toString().split(".").last),
                      onTap: () async {
                        Scaffold.of(context)
                            .showBottomSheet((context) => Material(
                                  type: MaterialType.card,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RadioListTile(
                                          value: ProlaceThemeMode.auto,
                                          groupValue: model.themeMode,
                                          onChanged: (_) {
                                            model.themeMode =
                                                ProlaceThemeMode.auto;
                                            Navigator.of(context).pop();
                                          },
                                          title: const Text("Auto")),
                                      RadioListTile(
                                          value: ProlaceThemeMode.light,
                                          groupValue: model.themeMode,
                                          onChanged: (_) {
                                            model.themeMode =
                                                ProlaceThemeMode.light;
                                            Navigator.of(context).pop();
                                          },
                                          title: const Text("Light")),
                                      RadioListTile(
                                          value: ProlaceThemeMode.dark,
                                          groupValue: model.themeMode,
                                          onChanged: (_) {
                                            model.themeMode =
                                                ProlaceThemeMode.dark;
                                            Navigator.of(context).pop();
                                          },
                                          title: const Text("Dark")),
                                    ],
                                  ),
                                ));
                      },
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    ListTile(
                      title: const Text("Seed color"),
                      trailing: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: model.seedColor,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onTap: () async {
                        var newColor =
                            await pickColor(context, model.seedColor);
                        model.seedColor = newColor;
                      },
                    ),
                    ListTile(
                      title: const Text("Dark Seed color"),
                      trailing: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: model.seedColorDark,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onTap: () async {
                        var newColor =
                            await pickColor(context, model.seedColorDark);
                        model.seedColorDark = newColor;
                      },
                    ),
                    const Divider(),
                    const SettingsLabel(
                      Text(
                        "Connection",
                      ),
                    ),
                    const ConnectionSettingsView(),
                    ListTile(
                      title: const Text("Internal SSIDs"),
                      subtitle: const Text(
                        "Manage which SSIDs should use the internal URL",
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(Routes.internalSsidView);
                      },
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    const Divider(),
                    ElevatedButton(
                        onPressed: model.logout, child: const Text("Logout"))
                  ],
                )));
  }
}

Widget colorTile(
    String name, Color color, Color selected, Function(Color color) onTap) {
  return ListTile(
    onTap: () => onTap(color),
    leading: selected.value == color.value
        ? const Icon(Icons.check)
        : const SizedBox(
            width: 24,
            height: 24,
          ),
    title: Text(name),
    trailing: Container(
      width: 24,
      height: 24,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
    ),
  );
}

final colors = {
  "Red": Colors.red,
  "Pink": Colors.pink,
  "Purple": Colors.purple,
  "Deep Purple": Colors.deepPurple,
  "Indigo": Colors.indigo,
  "Blue": Colors.blue,
  "Light Blue": Colors.lightBlue,
  "Cyan": Colors.cyan,
  "Teal": Colors.teal,
  "Green": Colors.green,
  "Light Green": Colors.lightGreen,
  "Lime": Colors.lime,
  "Yellow": Colors.yellow,
  "Amber": Colors.amber,
  "Orange": Colors.orange,
  "Deep Orange": Colors.deepOrange,
  "Brown": Colors.brown,
  "Grey": Colors.grey,
  "Blue Grey": Colors.blueGrey,
};

Future<Color> pickColor(BuildContext context, Color currentColor) async {
  final newColor = await showDialog<Color>(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text("Pick a color"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  for (final entry in colors.entries)
                    colorTile(entry.key, entry.value, currentColor, (color) {
                      Navigator.of(context).pop(color);
                    })
                ],
              ),
            ));
      });
  return newColor ?? currentColor;
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

class ConnectionSettingsView extends StackedHookView<SettingsModel> {
  const ConnectionSettingsView({super.key});

  @override
  Widget builder(BuildContext context, SettingsModel model) {
    final internalUrlController = useTextEditingController(
      text: model.internalUrl,
    );
    final externalUrlController =
        useTextEditingController(text: model.externalUrl);

    useEffect(() {
      internalUrlController.text = model.internalUrl ?? "";
      externalUrlController.text = model.externalUrl ?? "";
      return null;
    }, [model.internalUrl, model.externalUrl]);

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
              model.setInternalUrl(value);
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
              model.setExternalUrl(value);
            },
          ),
        ],
      ),
    );
  }
}
