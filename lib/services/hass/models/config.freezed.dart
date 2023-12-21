// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HassConfig _$HassConfigFromJson(Map<String, dynamic> json) {
  return _HassConfig.fromJson(json);
}

/// @nodoc
mixin _$HassConfig {
  List<String> get components => throw _privateConstructorUsedError;
  String get locationName => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get elevation => throw _privateConstructorUsedError;
  String get timeZone => throw _privateConstructorUsedError;
  HassUnitSystem get unitSystem => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  List<String> get whitelistExternalDirs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HassConfigCopyWith<HassConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HassConfigCopyWith<$Res> {
  factory $HassConfigCopyWith(
          HassConfig value, $Res Function(HassConfig) then) =
      _$HassConfigCopyWithImpl<$Res, HassConfig>;
  @useResult
  $Res call(
      {List<String> components,
      String locationName,
      String latitude,
      String longitude,
      String elevation,
      String timeZone,
      HassUnitSystem unitSystem,
      String version,
      List<String> whitelistExternalDirs});

  $HassUnitSystemCopyWith<$Res> get unitSystem;
}

/// @nodoc
class _$HassConfigCopyWithImpl<$Res, $Val extends HassConfig>
    implements $HassConfigCopyWith<$Res> {
  _$HassConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? components = null,
    Object? locationName = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? elevation = null,
    Object? timeZone = null,
    Object? unitSystem = null,
    Object? version = null,
    Object? whitelistExternalDirs = null,
  }) {
    return _then(_value.copyWith(
      components: null == components
          ? _value.components
          : components // ignore: cast_nullable_to_non_nullable
              as List<String>,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      elevation: null == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      unitSystem: null == unitSystem
          ? _value.unitSystem
          : unitSystem // ignore: cast_nullable_to_non_nullable
              as HassUnitSystem,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      whitelistExternalDirs: null == whitelistExternalDirs
          ? _value.whitelistExternalDirs
          : whitelistExternalDirs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HassUnitSystemCopyWith<$Res> get unitSystem {
    return $HassUnitSystemCopyWith<$Res>(_value.unitSystem, (value) {
      return _then(_value.copyWith(unitSystem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HassConfigImplCopyWith<$Res>
    implements $HassConfigCopyWith<$Res> {
  factory _$$HassConfigImplCopyWith(
          _$HassConfigImpl value, $Res Function(_$HassConfigImpl) then) =
      __$$HassConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> components,
      String locationName,
      String latitude,
      String longitude,
      String elevation,
      String timeZone,
      HassUnitSystem unitSystem,
      String version,
      List<String> whitelistExternalDirs});

  @override
  $HassUnitSystemCopyWith<$Res> get unitSystem;
}

/// @nodoc
class __$$HassConfigImplCopyWithImpl<$Res>
    extends _$HassConfigCopyWithImpl<$Res, _$HassConfigImpl>
    implements _$$HassConfigImplCopyWith<$Res> {
  __$$HassConfigImplCopyWithImpl(
      _$HassConfigImpl _value, $Res Function(_$HassConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? components = null,
    Object? locationName = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? elevation = null,
    Object? timeZone = null,
    Object? unitSystem = null,
    Object? version = null,
    Object? whitelistExternalDirs = null,
  }) {
    return _then(_$HassConfigImpl(
      components: null == components
          ? _value._components
          : components // ignore: cast_nullable_to_non_nullable
              as List<String>,
      locationName: null == locationName
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      elevation: null == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      unitSystem: null == unitSystem
          ? _value.unitSystem
          : unitSystem // ignore: cast_nullable_to_non_nullable
              as HassUnitSystem,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      whitelistExternalDirs: null == whitelistExternalDirs
          ? _value._whitelistExternalDirs
          : whitelistExternalDirs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HassConfigImpl implements _HassConfig {
  const _$HassConfigImpl(
      {required final List<String> components,
      required this.locationName,
      required this.latitude,
      required this.longitude,
      required this.elevation,
      required this.timeZone,
      required this.unitSystem,
      required this.version,
      required final List<String> whitelistExternalDirs})
      : _components = components,
        _whitelistExternalDirs = whitelistExternalDirs;

  factory _$HassConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$HassConfigImplFromJson(json);

  final List<String> _components;
  @override
  List<String> get components {
    if (_components is EqualUnmodifiableListView) return _components;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_components);
  }

  @override
  final String locationName;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String elevation;
  @override
  final String timeZone;
  @override
  final HassUnitSystem unitSystem;
  @override
  final String version;
  final List<String> _whitelistExternalDirs;
  @override
  List<String> get whitelistExternalDirs {
    if (_whitelistExternalDirs is EqualUnmodifiableListView)
      return _whitelistExternalDirs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whitelistExternalDirs);
  }

  @override
  String toString() {
    return 'HassConfig(components: $components, locationName: $locationName, latitude: $latitude, longitude: $longitude, elevation: $elevation, timeZone: $timeZone, unitSystem: $unitSystem, version: $version, whitelistExternalDirs: $whitelistExternalDirs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HassConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._components, _components) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.unitSystem, unitSystem) ||
                other.unitSystem == unitSystem) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality()
                .equals(other._whitelistExternalDirs, _whitelistExternalDirs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_components),
      locationName,
      latitude,
      longitude,
      elevation,
      timeZone,
      unitSystem,
      version,
      const DeepCollectionEquality().hash(_whitelistExternalDirs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HassConfigImplCopyWith<_$HassConfigImpl> get copyWith =>
      __$$HassConfigImplCopyWithImpl<_$HassConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HassConfigImplToJson(
      this,
    );
  }
}

abstract class _HassConfig implements HassConfig {
  const factory _HassConfig(
      {required final List<String> components,
      required final String locationName,
      required final String latitude,
      required final String longitude,
      required final String elevation,
      required final String timeZone,
      required final HassUnitSystem unitSystem,
      required final String version,
      required final List<String> whitelistExternalDirs}) = _$HassConfigImpl;

  factory _HassConfig.fromJson(Map<String, dynamic> json) =
      _$HassConfigImpl.fromJson;

  @override
  List<String> get components;
  @override
  String get locationName;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get elevation;
  @override
  String get timeZone;
  @override
  HassUnitSystem get unitSystem;
  @override
  String get version;
  @override
  List<String> get whitelistExternalDirs;
  @override
  @JsonKey(ignore: true)
  _$$HassConfigImplCopyWith<_$HassConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HassUnitSystem _$HassUnitSystemFromJson(Map<String, dynamic> json) {
  return _HassUnitSystem.fromJson(json);
}

/// @nodoc
mixin _$HassUnitSystem {
  String get length => throw _privateConstructorUsedError;
  String get mass => throw _privateConstructorUsedError;
  String get temperature => throw _privateConstructorUsedError;
  String get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HassUnitSystemCopyWith<HassUnitSystem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HassUnitSystemCopyWith<$Res> {
  factory $HassUnitSystemCopyWith(
          HassUnitSystem value, $Res Function(HassUnitSystem) then) =
      _$HassUnitSystemCopyWithImpl<$Res, HassUnitSystem>;
  @useResult
  $Res call({String length, String mass, String temperature, String volume});
}

/// @nodoc
class _$HassUnitSystemCopyWithImpl<$Res, $Val extends HassUnitSystem>
    implements $HassUnitSystemCopyWith<$Res> {
  _$HassUnitSystemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? mass = null,
    Object? temperature = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String,
      mass: null == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HassUnitSystemImplCopyWith<$Res>
    implements $HassUnitSystemCopyWith<$Res> {
  factory _$$HassUnitSystemImplCopyWith(_$HassUnitSystemImpl value,
          $Res Function(_$HassUnitSystemImpl) then) =
      __$$HassUnitSystemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String length, String mass, String temperature, String volume});
}

/// @nodoc
class __$$HassUnitSystemImplCopyWithImpl<$Res>
    extends _$HassUnitSystemCopyWithImpl<$Res, _$HassUnitSystemImpl>
    implements _$$HassUnitSystemImplCopyWith<$Res> {
  __$$HassUnitSystemImplCopyWithImpl(
      _$HassUnitSystemImpl _value, $Res Function(_$HassUnitSystemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? mass = null,
    Object? temperature = null,
    Object? volume = null,
  }) {
    return _then(_$HassUnitSystemImpl(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String,
      mass: null == mass
          ? _value.mass
          : mass // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as String,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HassUnitSystemImpl implements _HassUnitSystem {
  const _$HassUnitSystemImpl(
      {required this.length,
      required this.mass,
      required this.temperature,
      required this.volume});

  factory _$HassUnitSystemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HassUnitSystemImplFromJson(json);

  @override
  final String length;
  @override
  final String mass;
  @override
  final String temperature;
  @override
  final String volume;

  @override
  String toString() {
    return 'HassUnitSystem(length: $length, mass: $mass, temperature: $temperature, volume: $volume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HassUnitSystemImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.mass, mass) || other.mass == mass) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, length, mass, temperature, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HassUnitSystemImplCopyWith<_$HassUnitSystemImpl> get copyWith =>
      __$$HassUnitSystemImplCopyWithImpl<_$HassUnitSystemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HassUnitSystemImplToJson(
      this,
    );
  }
}

abstract class _HassUnitSystem implements HassUnitSystem {
  const factory _HassUnitSystem(
      {required final String length,
      required final String mass,
      required final String temperature,
      required final String volume}) = _$HassUnitSystemImpl;

  factory _HassUnitSystem.fromJson(Map<String, dynamic> json) =
      _$HassUnitSystemImpl.fromJson;

  @override
  String get length;
  @override
  String get mass;
  @override
  String get temperature;
  @override
  String get volume;
  @override
  @JsonKey(ignore: true)
  _$$HassUnitSystemImplCopyWith<_$HassUnitSystemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
