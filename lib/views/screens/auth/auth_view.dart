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
  Widget builder(BuildContext context, AuthModel model, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Auth"),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          children: [
            Text(
              "Authentication is required.",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: model.login, child: const Text("Login with OAuth")),
            const SizedBox(height: 16),
            const Text(
                "In case you have trouble with OAuth, you can use a long lived access token:"),
            const SizedBox(height: 8),
            Form(
              child: TextField(
                controller: accessTokenController,
                decoration: InputDecoration(
                    errorText: model.accessTokenValidationMessage,
                    label: const Text("Long lived access token")),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: model.loginWithToken,
                child: const Text("Login with access token")),
          ]),
    );
  }

  @override
  AuthModel viewModelBuilder(BuildContext context) {
    return AuthModel();
  }
}
