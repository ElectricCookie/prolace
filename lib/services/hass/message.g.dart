// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      type: json['type'] as String?,
      id: json['id'] as int?,
      haVersion: json['ha_version'] as String?,
      accessToken: json['access_token'] as String?,
      message: json['message'] as String?,
      result: json['result'],
      success: json['success'] as bool?,
      serviceData: json['service_data'] as Map<String, dynamic>?,
      domain: json['domain'] as String?,
      service: json['service'] as String?,
      target: json['target'] as Map<String, dynamic>?,
      eventType: json['event_type'] as String?,
    )..event = json['event'] == null
        ? null
        : HassEvent.fromJson(json['event'] as Map<String, dynamic>);

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'ha_version': instance.haVersion,
      'service_data': instance.serviceData,
      'target': instance.target,
      'result': instance.result,
      'event': instance.event,
      'access_token': instance.accessToken,
      'message': instance.message,
      'domain': instance.domain,
      'service': instance.service,
      'success': instance.success,
      'event_type': instance.eventType,
    };
