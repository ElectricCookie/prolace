import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class Entity with _$Entity {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Entity({
    String? areaId,
    String? configEntryId,
    String? deviceId,
    String? icon,
    String? entityId,
    String? name,
  }) = _Entity;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}
