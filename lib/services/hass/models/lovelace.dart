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
    String? icon,
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
    String? name,
    String? icon,
    String? entity,
    List<dynamic>? entities,
    List<MushroomChip>? chips,
    String? primaryInfo,
    bool? square,
    int? columns,
    String? secondaryInfo,
    String? iconColor,
  }) = _LovelaceCard;

  factory LovelaceCard.fromJson(Map<String, dynamic> json) =>
      _$LovelaceCardFromJson(json);
}

@freezed
class MushroomChip with _$MushroomChip {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MushroomChip({
    String? icon,
    String? name,
    String? entity,
    String? contentInfo,
  }) = _MushroomChip;

  factory MushroomChip.fromJson(Map<String, dynamic> json) =>
      _$MushroomChipFromJson(json);
}
