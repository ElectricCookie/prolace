// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lovelace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LovelaceViewImpl _$$LovelaceViewImplFromJson(Map<String, dynamic> json) =>
    _$LovelaceViewImpl(
      theme: json['theme'] as String?,
      title: json['title'] as String?,
      visible:
          (json['visible'] as List<dynamic>?)?.map((e) => e as String).toList(),
      path: json['path'] as String?,
      icon: json['icon'] as String?,
      subview: json['subview'] as bool?,
      type: json['type'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => LovelaceCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LovelaceViewImplToJson(_$LovelaceViewImpl instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'title': instance.title,
      'visible': instance.visible,
      'path': instance.path,
      'icon': instance.icon,
      'subview': instance.subview,
      'type': instance.type,
      'cards': instance.cards,
    };

_$LovelaceCardImpl _$$LovelaceCardImplFromJson(Map<String, dynamic> json) =>
    _$LovelaceCardImpl(
      type: json['type'] as String?,
      title: json['title'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => LovelaceCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      mapSource: json['map_source'] == null
          ? null
          : MapSource.fromJson(json['map_source'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : LovelaceCard.fromJson(json['card'] as Map<String, dynamic>),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      entity: json['entity'] as String?,
      template: json['template'] as String?,
      conditions: (json['conditions'] as List<dynamic>?)
          ?.map((e) => LovelaceCondition.fromJson(e as Map<String, dynamic>))
          .toList(),
      entities: json['entities'] as List<dynamic>?,
      chips: (json['chips'] as List<dynamic>?)
          ?.map((e) => MushroomChip.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryInfo: json['primary_info'] as String?,
      primary: json['primary'] as String?,
      secondary: json['secondary'] as String?,
      square: json['square'] as bool?,
      columns: json['columns'] as int?,
      secondaryInfo: json['secondary_info'] as String?,
      iconColor: json['icon_color'] as String?,
    );

Map<String, dynamic> _$$LovelaceCardImplToJson(_$LovelaceCardImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'cards': instance.cards,
      'map_source': instance.mapSource,
      'card': instance.card,
      'name': instance.name,
      'icon': instance.icon,
      'entity': instance.entity,
      'template': instance.template,
      'conditions': instance.conditions,
      'entities': instance.entities,
      'chips': instance.chips,
      'primary_info': instance.primaryInfo,
      'primary': instance.primary,
      'secondary': instance.secondary,
      'square': instance.square,
      'columns': instance.columns,
      'secondary_info': instance.secondaryInfo,
      'icon_color': instance.iconColor,
    };

_$MapSourceImpl _$$MapSourceImplFromJson(Map<String, dynamic> json) =>
    _$MapSourceImpl(
      camera: json['camera'] as String?,
    );

Map<String, dynamic> _$$MapSourceImplToJson(_$MapSourceImpl instance) =>
    <String, dynamic>{
      'camera': instance.camera,
    };

_$LovelaceConditionImpl _$$LovelaceConditionImplFromJson(
        Map<String, dynamic> json) =>
    _$LovelaceConditionImpl(
      condition: json['condition'] as String?,
      entity: json['entity'] as String?,
      state: json['state'],
      stateNot: json['state_not'],
      above: json['above'] as String?,
      below: json['below'] as String?,
      mediaQuery: json['media_query'] as String?,
      users:
          (json['users'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$LovelaceConditionImplToJson(
        _$LovelaceConditionImpl instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'entity': instance.entity,
      'state': instance.state,
      'state_not': instance.stateNot,
      'above': instance.above,
      'below': instance.below,
      'media_query': instance.mediaQuery,
      'users': instance.users,
    };

_$MushroomChipImpl _$$MushroomChipImplFromJson(Map<String, dynamic> json) =>
    _$MushroomChipImpl(
      icon: json['icon'] as String?,
      type: json['type'] as String,
      name: json['name'] as String?,
      entity: json['entity'] as String?,
      contentInfo: json['content_info'] as String?,
    );

Map<String, dynamic> _$$MushroomChipImplToJson(_$MushroomChipImpl instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'type': instance.type,
      'name': instance.name,
      'entity': instance.entity,
      'content_info': instance.contentInfo,
    };
