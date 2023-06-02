// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return _Entity.fromJson(json);
}

/// @nodoc
mixin _$Entity {
  String? get areaId => throw _privateConstructorUsedError;
  String? get configEntryId => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get entityId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityCopyWith<Entity> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCopyWith<$Res> {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) then) =
      _$EntityCopyWithImpl<$Res>;
  $Res call(
      {String? areaId,
      String? configEntryId,
      String? deviceId,
      String? icon,
      String? entityId,
      String? name});
}

/// @nodoc
class _$EntityCopyWithImpl<$Res> implements $EntityCopyWith<$Res> {
  _$EntityCopyWithImpl(this._value, this._then);

  final Entity _value;
  // ignore: unused_field
  final $Res Function(Entity) _then;

  @override
  $Res call({
    Object? areaId = freezed,
    Object? configEntryId = freezed,
    Object? deviceId = freezed,
    Object? icon = freezed,
    Object? entityId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      areaId: areaId == freezed
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String?,
      configEntryId: configEntryId == freezed
          ? _value.configEntryId
          : configEntryId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_EntityCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory _$$_EntityCopyWith(_$_Entity value, $Res Function(_$_Entity) then) =
      __$$_EntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? areaId,
      String? configEntryId,
      String? deviceId,
      String? icon,
      String? entityId,
      String? name});
}

/// @nodoc
class __$$_EntityCopyWithImpl<$Res> extends _$EntityCopyWithImpl<$Res>
    implements _$$_EntityCopyWith<$Res> {
  __$$_EntityCopyWithImpl(_$_Entity _value, $Res Function(_$_Entity) _then)
      : super(_value, (v) => _then(v as _$_Entity));

  @override
  _$_Entity get _value => super._value as _$_Entity;

  @override
  $Res call({
    Object? areaId = freezed,
    Object? configEntryId = freezed,
    Object? deviceId = freezed,
    Object? icon = freezed,
    Object? entityId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Entity(
      areaId: areaId == freezed
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String?,
      configEntryId: configEntryId == freezed
          ? _value.configEntryId
          : configEntryId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      entityId: entityId == freezed
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Entity implements _Entity {
  const _$_Entity(
      {this.areaId,
      this.configEntryId,
      this.deviceId,
      this.icon,
      this.entityId,
      this.name});

  factory _$_Entity.fromJson(Map<String, dynamic> json) =>
      _$$_EntityFromJson(json);

  @override
  final String? areaId;
  @override
  final String? configEntryId;
  @override
  final String? deviceId;
  @override
  final String? icon;
  @override
  final String? entityId;
  @override
  final String? name;

  @override
  String toString() {
    return 'Entity(areaId: $areaId, configEntryId: $configEntryId, deviceId: $deviceId, icon: $icon, entityId: $entityId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Entity &&
            const DeepCollectionEquality().equals(other.areaId, areaId) &&
            const DeepCollectionEquality()
                .equals(other.configEntryId, configEntryId) &&
            const DeepCollectionEquality().equals(other.deviceId, deviceId) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.entityId, entityId) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(areaId),
      const DeepCollectionEquality().hash(configEntryId),
      const DeepCollectionEquality().hash(deviceId),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(entityId),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_EntityCopyWith<_$_Entity> get copyWith =>
      __$$_EntityCopyWithImpl<_$_Entity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntityToJson(
      this,
    );
  }
}

abstract class _Entity implements Entity {
  const factory _Entity(
      {final String? areaId,
      final String? configEntryId,
      final String? deviceId,
      final String? icon,
      final String? entityId,
      final String? name}) = _$_Entity;

  factory _Entity.fromJson(Map<String, dynamic> json) = _$_Entity.fromJson;

  @override
  String? get areaId;
  @override
  String? get configEntryId;
  @override
  String? get deviceId;
  @override
  String? get icon;
  @override
  String? get entityId;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_EntityCopyWith<_$_Entity> get copyWith =>
      throw _privateConstructorUsedError;
}
