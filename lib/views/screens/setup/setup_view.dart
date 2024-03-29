import 'package:flutter/material.dart';
import 'package:home_portal/views/screens/setup/setup_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'setup_view.form.dart';

@FormView(fields: [
  FormTextField(name: "host", initialValue: "http://"),
  FormTextField(name: "port", initialValue: "8123"),
])
class SetupView extends StatelessWidget with $SetupView {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetupModel>.reactive(
        viewModelBuilder: (() => SetupModel()),
        onViewModelReady: (model) {
          model.init();
          syncFormWithViewModel(model);
        },
        onDispose: (model) => disposeForm(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text("Setup Prolace"),
              ),
              body: ListView(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 48.0, vertical: 16),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 3,
                          maxHeight: MediaQuery.of(context).size.height / 3),
                      child: Image.asset("assets/plugin.png")),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Connect to your Home Assistant instance",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Column(
                  children: model.hassInstances
                      .map((e) => ListTile(
                            title: Text(e),
                            onTap: () => model.connect("http://$e"),
                            subtitle: const Text("Found on your network"),
                            trailing: const Icon(Icons.chevron_right),
                          ))
                      .toList(),
                ),
                const Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    "Manual configuration",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            focusNode: hostFocusNode,
                            controller: hostController,
                            decoration: InputDecoration(
                                labelText: "IP Address",
                                hintText: "IP Address",
                                errorText: model.hostValidationMessage,
                                border: const OutlineInputBorder()),
                            onChanged: (value) => {},
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextField(
                            focusNode: portFocusNode,
                            controller: portController,
                            decoration: InputDecoration(
                                labelText: "Port",
                                hintText: "Port",
                                errorText: model.portValidationMessage,
                                border: const OutlineInputBorder()),
                            onChanged: (value) => {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed:
                              model.isFormValid ? model.connectManual : null,
                          child: const Text("Connect")),
                    ],
                  ),
                ),
              ]),
            ));
  }
}
