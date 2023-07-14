import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'view_selector_model.dart';

class ViewSelectorView extends StackedView<ViewSelectorModel> {
  final String currentSelectedPath;

  const ViewSelectorView({super.key, required this.currentSelectedPath});

  @override
  Widget builder(
      BuildContext context, ViewSelectorModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select LoveLace View"),
        ),
        body: ListView.builder(
            itemCount: viewModel.views.length + 1,
            itemBuilder: (context, index) {
              if (index == viewModel.views.length) {
                return ListTile(
                  title: Text("Magic Mirror Mode"),
                  onTap: () {
                    viewModel.onMagicMirrorModeSelected();
                  },
                );
              }

              var view = viewModel.views[index];

              return ListTile(
                leading: view.path == viewModel.currentView
                    ? Icon(Icons.check)
                    : null,
                title: Text(viewModel.views[index].title ?? ""),
                onTap: () {
                  viewModel.onViewSelected(index);
                },
              );
            }));
  }

  @override
  ViewSelectorModel viewModelBuilder(BuildContext context) {
    return ViewSelectorModel(currentSelectedPath);
  }
}
