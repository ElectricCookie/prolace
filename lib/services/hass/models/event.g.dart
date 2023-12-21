// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HassEventImpl _$$HassEventImplFromJson(Map<String, dynamic> json) =>
    _$HassEventImpl(
      eventType: json['event_type'] as String?,
      data: json['data'] == null
          ? null
          : HassEventData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HassEventImplToJson(_$HassEventImpl instance) =>
    <String, dynamic>{
      'event_type': instance.eventType,
      'data': instance.data,
    };

_$HassEventDataImpl _$$HassEventDataImplFromJson(Map<String, dynamic> json) =>
    _$HassEventDataImpl(
      entityId: json['entity_id'] as String?,
      newState: json['new_state'] == null
          ? null
          : HassState.fromJson(json['new_state'] as Map<String, dynamic>),
      oldState: json['old_state'] == null
          ? null
          : HassState.fromJson(json['old_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HassEventDataImplToJson(_$HassEventDataImpl instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'new_state': instance.newState,
      'old_state': instance.oldState,
    };
