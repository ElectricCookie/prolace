import 'package:flutter/material.dart';
import 'package:home_portal/services/hass/hass_service.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

class AppBuilder extends StackedView<AppBuilderModel> {
  const AppBuilder({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AppBuilderModel viewModel,
    Widget? child,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: viewModel.seedColor)),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: viewModel.seedColorDark, brightness: Brightness.dark)),
      // Use the above dark or light theme based on active themeMode.
      themeMode: viewModel.themeMode,
      initialRoute: Routes.loadingView,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }

  @override
  AppBuilderModel viewModelBuilder(BuildContext context) {
    return AppBuilderModel();
  }
}

class AppBuilderModel extends ReactiveViewModel {
  final _hassService = locator<HassService>();
  final _settingsService = locator<SettingsService>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_hassService, _settingsService];

  Color get seedColor => _settingsService.seedColor;
  Color get seedColorDark => _settingsService.seedColorDark;

  ThemeMode get themeMode {
    if (_settingsService.themeMode == ProlaceThemeMode.auto) {
      if (_hassService.ready) {
        var state = _hassService.state["sun.sun"];
        if (state != null) {
          if (state.state == "above_horizon") {
            return ThemeMode.light;
          } else {
            return ThemeMode.dark;
          }
        }
      }

      return ThemeMode.dark;
    } else if (_settingsService.themeMode == ProlaceThemeMode.light) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }
}
