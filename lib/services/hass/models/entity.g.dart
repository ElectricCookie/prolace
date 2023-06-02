// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entity _$$_EntityFromJson(Map<String, dynamic> json) => _$_Entity(
      areaId: json['area_id'] as String?,
      configEntryId: json['config_entry_id'] as String?,
      deviceId: json['device_id'] as String?,
      icon: json['icon'] as String?,
      entityId: json['entity_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_EntityToJson(_$_Entity instance) => <String, dynamic>{
      'area_id': instance.areaId,
      'config_entry_id': instance.configEntryId,
      'device_id': instance.deviceId,
      'icon': instance.icon,
      'entity_id': instance.entityId,
      'name': instance.name,
    };
