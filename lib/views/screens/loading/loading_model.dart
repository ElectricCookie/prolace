import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/auth/auth.dart';
import '../../../services/settings/settings_service.dart';

class LoadingModel extends ReactiveViewModel {
  @override
  List<ListenableServiceMixin> get listenableServices => [];

  final _settingsService = locator<SettingsService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  void init() async {
    await Future.delayed(Duration.zero);
    try {
      if (_settingsService.internalUrl == null) {
        _navigationService.navigateTo(Routes.setupView);
      } else {
        await _authService.init();

        if (_authService.isLoggedIn) {
          _navigationService.replaceWith(Routes.homeView);
        } else {
          _navigationService.navigateTo(Routes.authView);
        }
      }
    } catch (e) {
      _navigationService.navigateTo(Routes.setupView);
    }
  }
}
