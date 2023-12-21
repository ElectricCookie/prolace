import 'package:freezed_annotation/freezed_annotation.dart';

part 'lovelace.freezed.dart';
part 'lovelace.g.dart';

@freezed
class LovelaceView with _$LovelaceView {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LovelaceView({
    String? theme,
    String? title,
    List<String>? visible,
    String? path,
    String? icon,
    bool? subview,
    String? type,
    List<LovelaceCard>? cards,
  }) = _LovelaceView;

  factory LovelaceView.fromJson(Map<String, dynamic> json) =>
      _$LovelaceViewFromJson(json);
}

@freezed
class LovelaceCard with _$LovelaceCard {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LovelaceCard({
    String? type,
    String? title,
    List<LovelaceCard>? cards,
    MapSource? mapSource,
    LovelaceCard? card,
    String? name,
    String? icon,
    String? entity,
    String? template,
    List<LovelaceCondition>? conditions,
    List<dynamic>? entities,
    List<MushroomChip>? chips,
    String? primaryInfo,
    String? primary,
    String? secondary,
    bool? square,
    int? columns,
    String? secondaryInfo,
    String? iconColor,
  }) = _LovelaceCard;

  factory LovelaceCard.fromJson(Map<String, dynamic> json) =>
      _$LovelaceCardFromJson(json);
}

@freezed
class MapSource with _$MapSource {
  const factory MapSource({
    String? camera,
  }) = _MapSource;

  factory MapSource.fromJson(Map<String, dynamic> json) =>
      _$MapSourceFromJson(json);
}

@freezed
class LovelaceCondition with _$LovelaceCondition {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LovelaceCondition({
    String? condition,
    String? entity,
    // Either a string or a list of strings
    dynamic state,
    // Either a string or a list of strings
    dynamic stateNot,
    String? above,
    String? below,
    String? mediaQuery,
    List<String>? users,
  }) = _LovelaceCondition;

  factory LovelaceCondition.fromJson(Map<String, dynamic> json) =>
      _$LovelaceConditionFromJson(json);
}

@freezed
class MushroomChip with _$MushroomChip {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MushroomChip({
    String? icon,
    required String type,
    String? name,
    String? entity,
    String? contentInfo,
  }) = _MushroomChip;

  factory MushroomChip.fromJson(Map<String, dynamic> json) =>
      _$MushroomChipFromJson(json);
}
