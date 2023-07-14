// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HassEvent _$HassEventFromJson(Map<String, dynamic> json) {
  return _HassEvent.fromJson(json);
}

/// @nodoc
mixin _$HassEvent {
  String? get eventType => throw _privateConstructorUsedError;
  HassEventData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HassEventCopyWith<HassEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HassEventCopyWith<$Res> {
  factory $HassEventCopyWith(HassEvent value, $Res Function(HassEvent) then) =
      _$HassEventCopyWithImpl<$Res, HassEvent>;
  @useResult
  $Res call({String? eventType, HassEventData? data});

  $HassEventDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$HassEventCopyWithImpl<$Res, $Val extends HassEvent>
    implements $HassEventCopyWith<$Res> {
  _$HassEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HassEventData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HassEventDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $HassEventDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HassEventCopyWith<$Res> implements $HassEventCopyWith<$Res> {
  factory _$$_HassEventCopyWith(
          _$_HassEvent value, $Res Function(_$_HassEvent) then) =
      __$$_HassEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? eventType, HassEventData? data});

  @override
  $HassEventDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_HassEventCopyWithImpl<$Res>
    extends _$HassEventCopyWithImpl<$Res, _$_HassEvent>
    implements _$$_HassEventCopyWith<$Res> {
  __$$_HassEventCopyWithImpl(
      _$_HassEvent _value, $Res Function(_$_HassEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_HassEvent(
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HassEventData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_HassEvent implements _HassEvent {
  const _$_HassEvent({this.eventType, this.data});

  factory _$_HassEvent.fromJson(Map<String, dynamic> json) =>
      _$$_HassEventFromJson(json);

  @override
  final String? eventType;
  @override
  final HassEventData? data;

  @override
  String toString() {
    return 'HassEvent(eventType: $eventType, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HassEvent &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eventType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HassEventCopyWith<_$_HassEvent> get copyWith =>
      __$$_HassEventCopyWithImpl<_$_HassEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HassEventToJson(
      this,
    );
  }
}

abstract class _HassEvent implements HassEvent {
  const factory _HassEvent(
      {final String? eventType, final HassEventData? data}) = _$_HassEvent;

  factory _HassEvent.fromJson(Map<String, dynamic> json) =
      _$_HassEvent.fromJson;

  @override
  String? get eventType;
  @override
  HassEventData? get data;
  @override
  @JsonKey(ignore: true)
  _$$_HassEventCopyWith<_$_HassEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

HassEventData _$HassEventDataFromJson(Map<String, dynamic> json) {
  return _HassEventData.fromJson(json);
}

/// @nodoc
mixin _$HassEventData {
  String? get entityId => throw _privateConstructorUsedError;
  HassState? get newState => throw _privateConstructorUsedError;
  HassState? get oldState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HassEventDataCopyWith<HassEventData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HassEventDataCopyWith<$Res> {
  factory $HassEventDataCopyWith(
          HassEventData value, $Res Function(HassEventData) then) =
      _$HassEventDataCopyWithImpl<$Res, HassEventData>;
  @useResult
  $Res call({String? entityId, HassState? newState, HassState? oldState});

  $HassStateCopyWith<$Res>? get newState;
  $HassStateCopyWith<$Res>? get oldState;
}

/// @nodoc
class _$HassEventDataCopyWithImpl<$Res, $Val extends HassEventData>
    implements $HassEventDataCopyWith<$Res> {
  _$HassEventDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? newState = freezed,
    Object? oldState = freezed,
  }) {
    return _then(_value.copyWith(
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      newState: freezed == newState
          ? _value.newState
          : newState // ignore: cast_nullable_to_non_nullable
              as HassState?,
      oldState: freezed == oldState
          ? _value.oldState
          : oldState // ignore: cast_nullable_to_non_nullable
              as HassState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HassStateCopyWith<$Res>? get newState {
    if (_value.newState == null) {
      return null;
    }

    return $HassStateCopyWith<$Res>(_value.newState!, (value) {
      return _then(_value.copyWith(newState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HassStateCopyWith<$Res>? get oldState {
    if (_value.oldState == null) {
      return null;
    }

    return $HassStateCopyWith<$Res>(_value.oldState!, (value) {
      return _then(_value.copyWith(oldState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HassEventDataCopyWith<$Res>
    implements $HassEventDataCopyWith<$Res> {
  factory _$$_HassEventDataCopyWith(
          _$_HassEventData value, $Res Function(_$_HassEventData) then) =
      __$$_HassEventDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? entityId, HassState? newState, HassState? oldState});

  @override
  $HassStateCopyWith<$Res>? get newState;
  @override
  $HassStateCopyWith<$Res>? get oldState;
}

/// @nodoc
class __$$_HassEventDataCopyWithImpl<$Res>
    extends _$HassEventDataCopyWithImpl<$Res, _$_HassEventData>
    implements _$$_HassEventDataCopyWith<$Res> {
  __$$_HassEventDataCopyWithImpl(
      _$_HassEventData _value, $Res Function(_$_HassEventData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = freezed,
    Object? newState = freezed,
    Object? oldState = freezed,
  }) {
    return _then(_$_HassEventData(
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      newState: freezed == newState
          ? _value.newState
          : newState // ignore: cast_nullable_to_non_nullable
              as HassState?,
      oldState: freezed == oldState
          ? _value.oldState
          : oldState // ignore: cast_nullable_to_non_nullable
              as HassState?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_HassEventData implements _HassEventData {
  const _$_HassEventData({this.entityId, this.newState, this.oldState});

  factory _$_HassEventData.fromJson(Map<String, dynamic> json) =>
      _$$_HassEventDataFromJson(json);

  @override
  final String? entityId;
  @override
  final HassState? newState;
  @override
  final HassState? oldState;

  @override
  String toString() {
    return 'HassEventData(entityId: $entityId, newState: $newState, oldState: $oldState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HassEventData &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.newState, newState) ||
                other.newState == newState) &&
            (identical(other.oldState, oldState) ||
                other.oldState == oldState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entityId, newState, oldState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HassEventDataCopyWith<_$_HassEventData> get copyWith =>
      __$$_HassEventDataCopyWithImpl<_$_HassEventData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HassEventDataToJson(
      this,
    );
  }
}

abstract class _HassEventData implements HassEventData {
  const factory _HassEventData(
      {final String? entityId,
      final HassState? newState,
      final HassState? oldState}) = _$_HassEventData;

  factory _HassEventData.fromJson(Map<String, dynamic> json) =
      _$_HassEventData.fromJson;

  @override
  String? get entityId;
  @override
  HassState? get newState;
  @override
  HassState? get oldState;
  @override
  @JsonKey(ignore: true)
  _$$_HassEventDataCopyWith<_$_HassEventData> get copyWith =>
      throw _privateConstructorUsedError;
}
