// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Area _$AreaFromJson(Map<String, dynamic> json) {
  return _Area.fromJson(json);
}

/// @nodoc
mixin _$Area {
  String get areaId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AreaCopyWith<Area> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AreaCopyWith<$Res> {
  factory $AreaCopyWith(Area value, $Res Function(Area) then) =
      _$AreaCopyWithImpl<$Res>;
  $Res call({String areaId, String name, String? picture});
}

/// @nodoc
class _$AreaCopyWithImpl<$Res> implements $AreaCopyWith<$Res> {
  _$AreaCopyWithImpl(this._value, this._then);

  final Area _value;
  // ignore: unused_field
  final $Res Function(Area) _then;

  @override
  $Res call({
    Object? areaId = freezed,
    Object? name = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      areaId: areaId == freezed
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AreaCopyWith<$Res> implements $AreaCopyWith<$Res> {
  factory _$$_AreaCopyWith(_$_Area value, $Res Function(_$_Area) then) =
      __$$_AreaCopyWithImpl<$Res>;
  @override
  $Res call({String areaId, String name, String? picture});
}

/// @nodoc
class __$$_AreaCopyWithImpl<$Res> extends _$AreaCopyWithImpl<$Res>
    implements _$$_AreaCopyWith<$Res> {
  __$$_AreaCopyWithImpl(_$_Area _value, $Res Function(_$_Area) _then)
      : super(_value, (v) => _then(v as _$_Area));

  @override
  _$_Area get _value => super._value as _$_Area;

  @override
  $Res call({
    Object? areaId = freezed,
    Object? name = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$_Area(
      areaId: areaId == freezed
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Area implements _Area {
  const _$_Area({required this.areaId, required this.name, this.picture});

  factory _$_Area.fromJson(Map<String, dynamic> json) => _$$_AreaFromJson(json);

  @override
  final String areaId;
  @override
  final String name;
  @override
  final String? picture;

  @override
  String toString() {
    return 'Area(areaId: $areaId, name: $name, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Area &&
            const DeepCollectionEquality().equals(other.areaId, areaId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.picture, picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(areaId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(picture));

  @JsonKey(ignore: true)
  @override
  _$$_AreaCopyWith<_$_Area> get copyWith =>
      __$$_AreaCopyWithImpl<_$_Area>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AreaToJson(
      this,
    );
  }
}

abstract class _Area implements Area {
  const factory _Area(
      {required final String areaId,
      required final String name,
      final String? picture}) = _$_Area;

  factory _Area.fromJson(Map<String, dynamic> json) = _$_Area.fromJson;

  @override
  String get areaId;
  @override
  String get name;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$_AreaCopyWith<_$_Area> get copyWith => throw _privateConstructorUsedError;
}
