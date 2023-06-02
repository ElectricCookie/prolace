import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home_portal/services/hass/models/states.dart';

part 'event.g.dart';
part 'event.freezed.dart';

@freezed
class HassEvent with _$HassEvent {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HassEvent({
    String? eventType,
    HassEventData? data,
  }) = _HassEvent;

  factory HassEvent.fromJson(Map<String, dynamic> json) =>
      _$HassEventFromJson(json);
}

@freezed
class HassEventData with _$HassEventData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HassEventData({
    String? entityId,
    HassState? newState,
    HassState? oldState,
  }) = _HassEventData;

  factory HassEventData.fromJson(Map<String, dynamic> json) =>
      _$HassEventDataFromJson(json);
}
