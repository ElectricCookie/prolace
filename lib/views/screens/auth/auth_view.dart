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
class AuthView extends StackedView<AuthModel> with $AuthView {
  AuthView({super.key});

  @override
  void onViewModelReady(AuthModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  Widget builder(BuildContext context, AuthModel viewModel, Widget? child) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Auth"),
        ),
        body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48.0, vertical: 16),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width / 3,
                        maxHeight: MediaQuery.of(context).size.height / 3),
                    child: Image.asset("assets/plugin.png")),
              ),
              Text(
                "Connect to your Home Assistant instance at \n${viewModel.baseUrl}",
                style: const TextStyle(fontSize: 24),
              ),
              const Text(
                  "To access your Home Assistant instance, you need to login."),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: viewModel.login,
                  child: const Text("Login with OAuth")),
              const SizedBox(
                height: 32,
              ),
              const Text(
                  "In case you have trouble with OAuth, you can use a long lived access token:"),
              const SizedBox(height: 16),
              TextField(
                controller: accessTokenController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    errorText: viewModel.accessTokenValidationMessage,
                    label: const Text("Long lived access token")),
              ),
              TextButton(
                  onPressed: viewModel.loginWithToken,
                  child: const Text("Login with access token")),
              const SizedBox(height: 32),
              Row(
                children: [
                  TextButton(
                      onPressed: viewModel.reset,
                      child: const Text("Back to setup")),
                ],
              ),
            ]),
      ),
    );
  }

  @override
  AuthModel viewModelBuilder(BuildContext context) {
    return AuthModel();
  }
}
