import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../app/app.locator.dart';
import '../settings/settings_service.dart';
import 'oauth_token_result.dart';
import 'token_utils.dart';
import 'mobile.dart';
import 'oauth_handler.dart';

enum AuthServiceStatus {
  loading, // Initial state of the service
  loggedIn, // Logged in
  loggedOut, // Logged out
}

// Preference keys for storing the tokens.
String prefsAccessToken = "auth_service_access_token";
String prefsRefreshToken = "auth_service_refresh_token";
String prefsAccessTokenExpiry = "auth_service_access_token_expiry";

class AuthService extends ChangeNotifier {
  // Service status
  AuthServiceStatus _status = AuthServiceStatus.loading;
  AuthServiceStatus get status => _status;

  // Scopes requested
  List<String> scopes = ["openid", "email"];

  //  Timer that refreshes the access token
  Timer? _refreshTimer;

  final _settingsService = locator<SettingsService>();

  late SharedPreferences _preferences;

  OAuthHandler? _handler;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    _handler = MobileAuth(
        address: _settingsService.internalUrl!,
        redirectUrl: "com.example.prolace://login-callback",
        clientId: "https://electriccookie.github.io/prolace/",
        scopes: []);

    await _init();
  }

  Future<void> _init() async {
    _status = AuthServiceStatus.loading;
    notifyListeners();

    if (await hasRefreshToken) {
      // Theres a refresh token. Since we are starting. Fetch a new access token.
      await _refreshAccessToken();
    } else {
      // No refresh token. We are logged out.
      _status = AuthServiceStatus.loggedOut;
      notifyListeners();
    }

    // Start the refresh timer
    _startRefreshTimer();

    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == AppLifecycleState.resumed.toString()) {
        resurrect();
      }
      return null;
    });
  }

  void resurrect() {
    // Restart timer

    _startRefreshTimer();
  }

  Future<bool> get hasRefreshToken async {
    return (_preferences.getString(prefsRefreshToken)) != null;
  }

  bool get isLoggedIn => _status == AuthServiceStatus.loggedIn;

  // Token getters
  String? get refreshToken => _preferences.getString(prefsRefreshToken);
  String? get accessToken => _preferences.getString(prefsAccessToken);

  // Return a map  of claims in the id token
  Future<Map<String, dynamic>?> get idClaims async {
    return refreshToken != null ? getTokenPayload(refreshToken!) : null;
  }

  // Return the DateTime when the access token expires
  Future<DateTime?> get accessTokenExpiresAt async {
    var expiry = _preferences.getString(prefsAccessTokenExpiry);
    if (expiry != null) {
      return DateTime.parse(expiry);
    }
    return null;
  }

  Future<bool> get _shouldRefresh async {
    // Refresh 1 minute early to compensate timing differences.
    var buffer = const Duration(minutes: 1);
    var expiry = await accessTokenExpiresAt;
    return expiry != null && expiry.isBefore(DateTime.now().subtract(buffer));
  }

  Future<void> _refreshTimerTick() async {
    if (await _shouldRefresh) {
      // The access token has expired. Refresh it.
      try {
        await _refreshAccessToken();
      } catch (e) {
        // If refreshing fails, signal to the application that the user might not be logged in anymore
        _status = AuthServiceStatus.loggedOut;
      }
    }
    notifyListeners();
  }

  void _startRefreshTimer() async {
    // Cancel any existing timer
    _refreshTimer?.cancel();
    await _refreshTimerTick();
    // Start a new timer
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      await _refreshTimerTick();
    });
  }

  /// Forces a refresh independent of the expiry time
  Future<void> forceRefresh() async {
    await _refreshAccessToken();
  }

  Future<void> _refreshAccessToken() async {
    var refreshToken = this.refreshToken;
    if (refreshToken == null) {
      throw Exception("No refresh token");
    }

    var result = await _handler!.refreshAccessToken(refreshToken);

    // Store the new tokens
    _saveTokens(result);
    _status = AuthServiceStatus.loggedIn;
    notifyListeners();
  }

  // Persist all tokens in a TokenResponse
  void _saveTokens(OAuthTokenResult response) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(prefsAccessToken, response.accessToken!);
    prefs.setString(
        prefsAccessTokenExpiry,
        DateTime.now()
            .add(Duration(seconds: response.expiresIn))
            .toIso8601String());

    if (response.refreshToken != null) {
      prefs.setString(prefsRefreshToken, response.refreshToken!);
    }
  }

  // Try to log the user in. Returns a future bool whether the attempt was successful.
  Future<void> login() async {
    if (_handler == null) {
      init();
    }
    var result = await _handler!.login();
    _saveTokens(result);
    _status = AuthServiceStatus.loggedIn;
    notifyListeners();
  }

  Future<void> logout() async {
    _preferences.remove(prefsAccessToken);
    _preferences.remove(prefsRefreshToken);

    _preferences.remove(prefsAccessTokenExpiry);
    _status = AuthServiceStatus.loggedOut;
    notifyListeners();
  }
}
