// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HassConfigImpl _$$HassConfigImplFromJson(Map<String, dynamic> json) =>
    _$HassConfigImpl(
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

Map<String, dynamic> _$$HassConfigImplToJson(_$HassConfigImpl instance) =>
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

_$HassUnitSystemImpl _$$HassUnitSystemImplFromJson(Map<String, dynamic> json) =>
    _$HassUnitSystemImpl(
      length: json['length'] as String,
      mass: json['mass'] as String,
      temperature: json['temperature'] as String,
      volume: json['volume'] as String,
    );

Map<String, dynamic> _$$HassUnitSystemImplToJson(
        _$HassUnitSystemImpl instance) =>
    <String, dynamic>{
      'length': instance.length,
      'mass': instance.mass,
      'temperature': instance.temperature,
      'volume': instance.volume,
    };
