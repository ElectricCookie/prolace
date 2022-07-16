import 'package:home_portal/services/autodiscovery/autodiscovery_service.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:home_portal/views/screens/auth/auth_view.dart';
import 'package:home_portal/views/screens/setup/setup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/screens/loading/loading_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoadingView, initial: true),
  MaterialRoute(page: SetupView),
  MaterialRoute(page: AuthView)
], dependencies: [
  Singleton(classType: NavigationService),
  Singleton(classType: DialogService),
  Singleton(classType: SettingsService),
  LazySingleton(classType: AutodiscoveryService),
])
class App {}
