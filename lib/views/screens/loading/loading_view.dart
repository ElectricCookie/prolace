import 'package:flutter/material.dart';
import 'package:home_portal/views/screens/loading/loading_model.dart';
import 'package:stacked/stacked.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoadingModel>.reactive(
      viewModelBuilder: () => LoadingModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
