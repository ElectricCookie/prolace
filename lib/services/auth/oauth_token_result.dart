import 'package:json_annotation/json_annotation.dart';

part 'oauth_token_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OAuthTokenResult {
  String? accessToken;
  String? refreshToken;

  int expiresIn;
  OAuthTokenResult({
    this.accessToken,
    this.refreshToken,
    required this.expiresIn,
  });

  factory OAuthTokenResult.fromJson(Map<String, dynamic> json) =>
      _$OAuthTokenResultFromJson(json);

  Map<String, dynamic> toJson() => _$OAuthTokenResultToJson(this);
}
