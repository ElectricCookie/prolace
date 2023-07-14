import 'package:flutter_appauth/flutter_appauth.dart';

import 'oauth_handler.dart';
import 'oauth_token_result.dart';

class MobileAuth extends OAuthHandler {
  final String address;
  final String clientId;
  final String redirectUrl;
  final List<String> scopes;

  final FlutterAppAuth appAuth = FlutterAppAuth();

  MobileAuth({
    required this.address,
    required this.clientId,
    required this.redirectUrl,
    required this.scopes,
  });

  AuthorizationServiceConfiguration get _configuration =>
      AuthorizationServiceConfiguration(
          authorizationEndpoint: "$address/auth/authorize",
          tokenEndpoint: "$address/auth/token");

  @override
  Future<OAuthTokenResult> login() async {
    final AuthorizationTokenResponse? result =
        await appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
      clientId,
      allowInsecureConnections: true,
      redirectUrl,
      serviceConfiguration: _configuration,
      scopes: scopes,
    ));
    if (result == null) {
      throw Exception("Failed to login. No result was returned");
    }
    print(result);
    return OAuthTokenResult(
      accessToken: result.accessToken!,
      refreshToken: result.refreshToken!,
      expiresIn: result.accessTokenExpirationDateTime!
          .difference(DateTime.now())
          .inSeconds,
    );
  }

  @override
  Future<OAuthTokenResult> refreshAccessToken(
    String refreshToken,
  ) async {
    final TokenResponse? result = await appAuth.token(TokenRequest(
        clientId, redirectUrl,
        serviceConfiguration: _configuration,
        refreshToken: refreshToken,
        allowInsecureConnections: true,
        scopes: scopes));

    if (result == null) {
      throw Exception("Failed to refresh access token. No result was returned");
    }

    return OAuthTokenResult(
      accessToken: result.accessToken!,
      refreshToken: result.refreshToken,
      expiresIn: result.accessTokenExpirationDateTime!
          .difference(DateTime.now())
          .inSeconds,
    );
  }
}
