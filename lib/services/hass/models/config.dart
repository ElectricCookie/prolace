import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class HassConfig with _$HassConfig {
  const factory HassConfig({
    required List<String> components,
    required String locationName,
    required String latitude,
    required String longitude,
    required String elevation,
    required String timeZone,
    required HassUnitSystem unitSystem,
    required String version,
    required List<String> whitelistExternalDirs,
  }) = _HassConfig;

  factory HassConfig.fromJson(Map<String, dynamic> json) =>
      _$HassConfigFromJson(json);
}

@freezed
class HassUnitSystem with _$HassUnitSystem {
  const factory HassUnitSystem({
    required String length,
    required String mass,
    required String temperature,
    required String volume,
  }) = _HassUnitSystem;

  factory HassUnitSystem.fromJson(Map<String, dynamic> json) =>
      _$HassUnitSystemFromJson(json);
}
