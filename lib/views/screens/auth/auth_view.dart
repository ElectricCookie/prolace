import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'auth_model.dart';
import 'auth_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "accessToken",
      initialValue: "",
    ),
  ],
)
class AuthView extends StatelessWidget with $AuthView {
  AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthModel>.reactive(
        viewModelBuilder: () => AuthModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text("Auth"),
              ),
              body: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  children: [
                    Text(
                      "Authentication is required.",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: model.login,
                        child: const Text("Login with OAuth")),
                    const SizedBox(height: 16),
                    const Text(
                        "In case you have trouble with OAuth, you can use a long lived access token:"),
                    const SizedBox(height: 8),
                    TextField(
                      controller: accessTokenController,
                      decoration: const InputDecoration(
                          label: Text("Long lived access token")),
                    ),
                  ]),
            ));
  }
}
