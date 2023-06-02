// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HassEvent _$$_HassEventFromJson(Map<String, dynamic> json) => _$_HassEvent(
      eventType: json['event_type'] as String?,
      data: json['data'] == null
          ? null
          : HassEventData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HassEventToJson(_$_HassEvent instance) =>
    <String, dynamic>{
      'event_type': instance.eventType,
      'data': instance.data,
    };

_$_HassEventData _$$_HassEventDataFromJson(Map<String, dynamic> json) =>
    _$_HassEventData(
      entityId: json['entity_id'] as String?,
      newState: json['new_state'] == null
          ? null
          : HassState.fromJson(json['new_state'] as Map<String, dynamic>),
      oldState: json['old_state'] == null
          ? null
          : HassState.fromJson(json['old_state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_HassEventDataToJson(_$_HassEventData instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'new_state': instance.newState,
      'old_state': instance.oldState,
    };
