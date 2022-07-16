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
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthModel>.reactive(
        viewModelBuilder: () => AuthModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text("Auth"),
              ),
              body: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: accessTokenController,
                    decoration:
                        InputDecoration(label: Text("Long lived access token")),
                  ),
                ),
              ]),
            ));
  }
}
