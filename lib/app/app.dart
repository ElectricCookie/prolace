import 'package:home_portal/services/auth/auth.dart';
import 'package:home_portal/services/autodiscovery/autodiscovery_service.dart';
import 'package:home_portal/services/hass/hass_service.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:home_portal/views/screens/auth/auth_view.dart';
import 'package:home_portal/views/screens/home/home_view.dart';
import 'package:home_portal/views/screens/settings/internal_ssid_view.dart';
import 'package:home_portal/views/screens/settings/settings_view.dart';
import 'package:home_portal/views/screens/setup/setup_view.dart';
import 'package:home_portal/views/screens/view_selector/view_selector_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/screens/loading/loading_view.dart';
import '../views/screens/settings/entity_selector_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoadingView, initial: true),
  MaterialRoute(page: SetupView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: AuthView),
  MaterialRoute(page: EntitySelectorView),
  MaterialRoute(page: ViewSelectorView),
  MaterialRoute(page: SettingsView),
  MaterialRoute(page: InternalSsidView)
], dependencies: [
  Singleton(classType: NavigationService),
  Singleton(classType: DialogService),
  Singleton(classType: SettingsService),
  LazySingleton(classType: AutodiscoveryService),
  LazySingleton(classType: AuthService),
  LazySingleton(classType: HassService)
])
class App {}
