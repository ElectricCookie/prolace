// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HassStateImpl _$$HassStateImplFromJson(Map<String, dynamic> json) =>
    _$HassStateImpl(
      entityId: json['entity_id'] as String,
      state: json['state'] as String,
      attributes: json['attributes'] as Map<String, dynamic>,
      lastChanged: json['last_changed'] as String?,
      lastUpdated: json['last_updated'] as String?,
    );

Map<String, dynamic> _$$HassStateImplToJson(_$HassStateImpl instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'state': instance.state,
      'attributes': instance.attributes,
      'last_changed': instance.lastChanged,
      'last_updated': instance.lastUpdated,
    };
