// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HassConfig _$$_HassConfigFromJson(Map<String, dynamic> json) =>
    _$_HassConfig(
      components: (json['components'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      locationName: json['locationName'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      elevation: json['elevation'] as String,
      timeZone: json['timeZone'] as String,
      unitSystem:
          HassUnitSystem.fromJson(json['unitSystem'] as Map<String, dynamic>),
      version: json['version'] as String,
      whitelistExternalDirs: (json['whitelistExternalDirs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_HassConfigToJson(_$_HassConfig instance) =>
    <String, dynamic>{
      'components': instance.components,
      'locationName': instance.locationName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'timeZone': instance.timeZone,
      'unitSystem': instance.unitSystem,
      'version': instance.version,
      'whitelistExternalDirs': instance.whitelistExternalDirs,
    };

_$_HassUnitSystem _$$_HassUnitSystemFromJson(Map<String, dynamic> json) =>
    _$_HassUnitSystem(
      length: json['length'] as String,
      mass: json['mass'] as String,
      temperature: json['temperature'] as String,
      volume: json['volume'] as String,
    );

Map<String, dynamic> _$$_HassUnitSystemToJson(_$_HassUnitSystem instance) =>
    <String, dynamic>{
      'length': instance.length,
      'mass': instance.mass,
      'temperature': instance.temperature,
      'volume': instance.volume,
    };
