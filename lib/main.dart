import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_portal/app/app.locator.dart';
import 'package:home_portal/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'services/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  var settings = locator<SettingsService>();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await settings.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeMode.dark;

    const FlexScheme usedScheme = FlexScheme.materialBaseline;

    var light = FlexThemeData.light(scheme: usedScheme, useMaterial3: true);
    var dark = FlexThemeData.dark(scheme: usedScheme, useMaterial3: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: light.copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: light.colorScheme.background,
              foregroundColor: light.colorScheme.onBackground,
              brightness: Brightness.dark)),
      // Same definition for the dark theme, but using FlexThemeData.dark().
      darkTheme: dark.copyWith(
          appBarTheme: AppBarTheme(
              backgroundColor: dark.colorScheme.background,
              foregroundColor: dark.colorScheme.onBackground,
              brightness: Brightness.dark)),
      // Use the above dark or light theme based on active themeMode.
      themeMode: themeMode,
      initialRoute: Routes.loadingView,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
