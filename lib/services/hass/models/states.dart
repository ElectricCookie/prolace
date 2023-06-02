import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';
part 'states.g.dart';

@freezed
class HassState with _$HassState {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HassState({
    required String entityId,
    required String state,
    required Map<String, dynamic> attributes,
    String? lastChanged,
    String? lastUpdated,
  }) = _HassState;
  factory HassState.fromJson(Map<String, dynamic> json) =>
      _$HassStateFromJson(json);
}

