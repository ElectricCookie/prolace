import 'package:freezed_annotation/freezed_annotation.dart';

part 'area.freezed.dart';
part 'area.g.dart';

@freezed
class Area with _$Area {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Area({
    required String areaId,
    required String name,
    String? picture,
  }) = _Area;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}
