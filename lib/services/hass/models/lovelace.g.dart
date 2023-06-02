// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lovelace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LovelaceView _$$_LovelaceViewFromJson(Map<String, dynamic> json) =>
    _$_LovelaceView(
      theme: json['theme'] as String?,
      title: json['title'] as String?,
      visible:
          (json['visible'] as List<dynamic>?)?.map((e) => e as String).toList(),
      icon: json['icon'] as String?,
      type: json['type'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => LovelaceCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LovelaceViewToJson(_$_LovelaceView instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'title': instance.title,
      'visible': instance.visible,
      'icon': instance.icon,
      'type': instance.type,
      'cards': instance.cards,
    };

_$_LovelaceCard _$$_LovelaceCardFromJson(Map<String, dynamic> json) =>
    _$_LovelaceCard(
      type: json['type'] as String?,
      title: json['title'] as String?,
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => LovelaceCard.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      entity: json['entity'] as String?,
      entities: json['entities'] as List<dynamic>?,
      chips: (json['chips'] as List<dynamic>?)
          ?.map((e) => MushroomChip.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryInfo: json['primary_info'] as String?,
      square: json['square'] as bool?,
      columns: json['columns'] as int?,
      secondaryInfo: json['secondary_info'] as String?,
      iconColor: json['icon_color'] as String?,
    );

Map<String, dynamic> _$$_LovelaceCardToJson(_$_LovelaceCard instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'cards': instance.cards,
      'name': instance.name,
      'icon': instance.icon,
      'entity': instance.entity,
      'entities': instance.entities,
      'chips': instance.chips,
      'primary_info': instance.primaryInfo,
      'square': instance.square,
      'columns': instance.columns,
      'secondary_info': instance.secondaryInfo,
      'icon_color': instance.iconColor,
    };

_$_MushroomChip _$$_MushroomChipFromJson(Map<String, dynamic> json) =>
    _$_MushroomChip(
      icon: json['icon'] as String?,
      name: json['name'] as String?,
      entity: json['entity'] as String?,
      contentInfo: json['content_info'] as String?,
    );

Map<String, dynamic> _$$_MushroomChipToJson(_$_MushroomChip instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'name': instance.name,
      'entity': instance.entity,
      'content_info': instance.contentInfo,
    };
