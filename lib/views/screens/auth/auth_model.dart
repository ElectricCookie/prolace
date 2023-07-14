import 'package:home_portal/services/auth/auth.dart';
import 'package:home_portal/services/settings/settings_service.dart';
import 'package:home_portal/views/screens/auth/auth_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class AuthModel extends FormViewModel {
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
    setBusy(true);
    if (accessTokenValue != null) {
      try {
        _authService.loginWithToken(accessTokenValue!);
        _navigationService.navigateTo(Routes.loadingView);
      } catch (e) {
        print(e);
        setAccessTokenValidationMessage(e.toString());
      }
    }
    setBusy(false);
  }
}
