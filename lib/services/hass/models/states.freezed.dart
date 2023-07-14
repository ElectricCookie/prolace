// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HassState _$HassStateFromJson(Map<String, dynamic> json) {
  return _HassState.fromJson(json);
}

/// @nodoc
mixin _$HassState {
  String get entityId => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  Map<String, dynamic> get attributes => throw _privateConstructorUsedError;
  String? get lastChanged => throw _privateConstructorUsedError;
  String? get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HassStateCopyWith<HassState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HassStateCopyWith<$Res> {
  factory $HassStateCopyWith(HassState value, $Res Function(HassState) then) =
      _$HassStateCopyWithImpl<$Res, HassState>;
  @useResult
  $Res call(
      {String entityId,
      String state,
      Map<String, dynamic> attributes,
      String? lastChanged,
      String? lastUpdated});
}

/// @nodoc
class _$HassStateCopyWithImpl<$Res, $Val extends HassState>
    implements $HassStateCopyWith<$Res> {
  _$HassStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = null,
    Object? state = null,
    Object? attributes = null,
    Object? lastChanged = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      lastChanged: freezed == lastChanged
          ? _value.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HassStateCopyWith<$Res> implements $HassStateCopyWith<$Res> {
  factory _$$_HassStateCopyWith(
          _$_HassState value, $Res Function(_$_HassState) then) =
      __$$_HassStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String entityId,
      String state,
      Map<String, dynamic> attributes,
      String? lastChanged,
      String? lastUpdated});
}

/// @nodoc
class __$$_HassStateCopyWithImpl<$Res>
    extends _$HassStateCopyWithImpl<$Res, _$_HassState>
    implements _$$_HassStateCopyWith<$Res> {
  __$$_HassStateCopyWithImpl(
      _$_HassState _value, $Res Function(_$_HassState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = null,
    Object? state = null,
    Object? attributes = null,
    Object? lastChanged = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$_HassState(
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      lastChanged: freezed == lastChanged
          ? _value.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_HassState implements _HassState {
  const _$_HassState(
      {required this.entityId,
      required this.state,
      required final Map<String, dynamic> attributes,
      this.lastChanged,
      this.lastUpdated})
      : _attributes = attributes;

  factory _$_HassState.fromJson(Map<String, dynamic> json) =>
      _$$_HassStateFromJson(json);

  @override
  final String entityId;
  @override
  final String state;
  final Map<String, dynamic> _attributes;
  @override
  Map<String, dynamic> get attributes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attributes);
  }

  @override
  final String? lastChanged;
  @override
  final String? lastUpdated;

  @override
  String toString() {
    return 'HassState(entityId: $entityId, state: $state, attributes: $attributes, lastChanged: $lastChanged, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HassState &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes) &&
            (identical(other.lastChanged, lastChanged) ||
                other.lastChanged == lastChanged) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      entityId,
      state,
      const DeepCollectionEquality().hash(_attributes),
      lastChanged,
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HassStateCopyWith<_$_HassState> get copyWith =>
      __$$_HassStateCopyWithImpl<_$_HassState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HassStateToJson(
      this,
    );
  }
}

abstract class _HassState implements HassState {
  const factory _HassState(
      {required final String entityId,
      required final String state,
      required final Map<String, dynamic> attributes,
      final String? lastChanged,
      final String? lastUpdated}) = _$_HassState;

  factory _HassState.fromJson(Map<String, dynamic> json) =
      _$_HassState.fromJson;

  @override
  String get entityId;
  @override
  String get state;
  @override
  Map<String, dynamic> get attributes;
  @override
  String? get lastChanged;
  @override
  String? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_HassStateCopyWith<_$_HassState> get copyWith =>
      throw _privateConstructorUsedError;
}
