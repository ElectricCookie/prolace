import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_portal/app/app.locator.dart';
import 'package:home_portal/theme_builder.dart';

import 'services/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  var settings = locator<SettingsService>();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await settings.init();

  runApp(const AppBuilder());
}
