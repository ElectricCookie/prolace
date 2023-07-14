import 'package:home_portal/services/auth/auth.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class AuthModel extends BaseViewModel {
  // Call the auth service
  final SettingsService _settingsService = locator<SettingsService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  void login() async {
    // Url is set in the settings service
    var url = _settingsService.internalUrl;

    assert(url != null);

    await _authService.login();

    _navigationService.back();
  }

  void loginWithToken() {
    //_authService.loginWithToken();
  }
}
