// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'lovelace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LovelaceView _$LovelaceViewFromJson(Map<String, dynamic> json) {
  return _LovelaceView.fromJson(json);
}

/// @nodoc
mixin _$LovelaceView {
  String? get theme => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<String>? get visible => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<LovelaceCard>? get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LovelaceViewCopyWith<LovelaceView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LovelaceViewCopyWith<$Res> {
  factory $LovelaceViewCopyWith(
          LovelaceView value, $Res Function(LovelaceView) then) =
      _$LovelaceViewCopyWithImpl<$Res, LovelaceView>;
  @useResult
  $Res call(
      {String? theme,
      String? title,
      List<String>? visible,
      String? path,
      String? icon,
      String? type,
      List<LovelaceCard>? cards});
}

/// @nodoc
class _$LovelaceViewCopyWithImpl<$Res, $Val extends LovelaceView>
    implements $LovelaceViewCopyWith<$Res> {
  _$LovelaceViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = freezed,
    Object? title = freezed,
    Object? visible = freezed,
    Object? path = freezed,
    Object? icon = freezed,
    Object? type = freezed,
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      visible: freezed == visible
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LovelaceCard>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LovelaceViewCopyWith<$Res>
    implements $LovelaceViewCopyWith<$Res> {
  factory _$$_LovelaceViewCopyWith(
          _$_LovelaceView value, $Res Function(_$_LovelaceView) then) =
      __$$_LovelaceViewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? theme,
      String? title,
      List<String>? visible,
      String? path,
      String? icon,
      String? type,
      List<LovelaceCard>? cards});
}

/// @nodoc
class __$$_LovelaceViewCopyWithImpl<$Res>
    extends _$LovelaceViewCopyWithImpl<$Res, _$_LovelaceView>
    implements _$$_LovelaceViewCopyWith<$Res> {
  __$$_LovelaceViewCopyWithImpl(
      _$_LovelaceView _value, $Res Function(_$_LovelaceView) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = freezed,
    Object? title = freezed,
    Object? visible = freezed,
    Object? path = freezed,
    Object? icon = freezed,
    Object? type = freezed,
    Object? cards = freezed,
  }) {
    return _then(_$_LovelaceView(
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      visible: freezed == visible
          ? _value._visible
          : visible // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LovelaceCard>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_LovelaceView implements _LovelaceView {
  const _$_LovelaceView(
      {this.theme,
      this.title,
      final List<String>? visible,
      this.path,
      this.icon,
      this.type,
      final List<LovelaceCard>? cards})
      : _visible = visible,
        _cards = cards;

  factory _$_LovelaceView.fromJson(Map<String, dynamic> json) =>
      _$$_LovelaceViewFromJson(json);

  @override
  final String? theme;
  @override
  final String? title;
  final List<String>? _visible;
  @override
  List<String>? get visible {
    final value = _visible;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? path;
  @override
  final String? icon;
  @override
  final String? type;
  final List<LovelaceCard>? _cards;
  @override
  List<LovelaceCard>? get cards {
    final value = _cards;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LovelaceView(theme: $theme, title: $title, visible: $visible, path: $path, icon: $icon, type: $type, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LovelaceView &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._visible, _visible) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      theme,
      title,
      const DeepCollectionEquality().hash(_visible),
      path,
      icon,
      type,
      const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LovelaceViewCopyWith<_$_LovelaceView> get copyWith =>
      __$$_LovelaceViewCopyWithImpl<_$_LovelaceView>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LovelaceViewToJson(
      this,
    );
  }
}

abstract class _LovelaceView implements LovelaceView {
  const factory _LovelaceView(
      {final String? theme,
      final String? title,
      final List<String>? visible,
      final String? path,
      final String? icon,
      final String? type,
      final List<LovelaceCard>? cards}) = _$_LovelaceView;

  factory _LovelaceView.fromJson(Map<String, dynamic> json) =
      _$_LovelaceView.fromJson;

  @override
  String? get theme;
  @override
  String? get title;
  @override
  List<String>? get visible;
  @override
  String? get path;
  @override
  String? get icon;
  @override
  String? get type;
  @override
  List<LovelaceCard>? get cards;
  @override
  @JsonKey(ignore: true)
  _$$_LovelaceViewCopyWith<_$_LovelaceView> get copyWith =>
      throw _privateConstructorUsedError;
}

LovelaceCard _$LovelaceCardFromJson(Map<String, dynamic> json) {
  return _LovelaceCard.fromJson(json);
}

/// @nodoc
mixin _$LovelaceCard {
  String? get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<LovelaceCard>? get cards => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get entity => throw _privateConstructorUsedError;
  List<dynamic>? get entities => throw _privateConstructorUsedError;
  List<MushroomChip>? get chips => throw _privateConstructorUsedError;
  String? get primaryInfo => throw _privateConstructorUsedError;
  bool? get square => throw _privateConstructorUsedError;
  int? get columns => throw _privateConstructorUsedError;
  String? get secondaryInfo => throw _privateConstructorUsedError;
  String? get iconColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LovelaceCardCopyWith<LovelaceCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LovelaceCardCopyWith<$Res> {
  factory $LovelaceCardCopyWith(
          LovelaceCard value, $Res Function(LovelaceCard) then) =
      _$LovelaceCardCopyWithImpl<$Res, LovelaceCard>;
  @useResult
  $Res call(
      {String? type,
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
      String? iconColor});
}

/// @nodoc
class _$LovelaceCardCopyWithImpl<$Res, $Val extends LovelaceCard>
    implements $LovelaceCardCopyWith<$Res> {
  _$LovelaceCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? title = freezed,
    Object? cards = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? entity = freezed,
    Object? entities = freezed,
    Object? chips = freezed,
    Object? primaryInfo = freezed,
    Object? square = freezed,
    Object? columns = freezed,
    Object? secondaryInfo = freezed,
    Object? iconColor = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LovelaceCard>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      entities: freezed == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      chips: freezed == chips
          ? _value.chips
          : chips // ignore: cast_nullable_to_non_nullable
              as List<MushroomChip>?,
      primaryInfo: freezed == primaryInfo
          ? _value.primaryInfo
          : primaryInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      square: freezed == square
          ? _value.square
          : square // ignore: cast_nullable_to_non_nullable
              as bool?,
      columns: freezed == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int?,
      secondaryInfo: freezed == secondaryInfo
          ? _value.secondaryInfo
          : secondaryInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      iconColor: freezed == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LovelaceCardCopyWith<$Res>
    implements $LovelaceCardCopyWith<$Res> {
  factory _$$_LovelaceCardCopyWith(
          _$_LovelaceCard value, $Res Function(_$_LovelaceCard) then) =
      __$$_LovelaceCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
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
      String? iconColor});
}

/// @nodoc
class __$$_LovelaceCardCopyWithImpl<$Res>
    extends _$LovelaceCardCopyWithImpl<$Res, _$_LovelaceCard>
    implements _$$_LovelaceCardCopyWith<$Res> {
  __$$_LovelaceCardCopyWithImpl(
      _$_LovelaceCard _value, $Res Function(_$_LovelaceCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? title = freezed,
    Object? cards = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? entity = freezed,
    Object? entities = freezed,
    Object? chips = freezed,
    Object? primaryInfo = freezed,
    Object? square = freezed,
    Object? columns = freezed,
    Object? secondaryInfo = freezed,
    Object? iconColor = freezed,
  }) {
    return _then(_$_LovelaceCard(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cards: freezed == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<LovelaceCard>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      entities: freezed == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      chips: freezed == chips
          ? _value._chips
          : chips // ignore: cast_nullable_to_non_nullable
              as List<MushroomChip>?,
      primaryInfo: freezed == primaryInfo
          ? _value.primaryInfo
          : primaryInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      square: freezed == square
          ? _value.square
          : square // ignore: cast_nullable_to_non_nullable
              as bool?,
      columns: freezed == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int?,
      secondaryInfo: freezed == secondaryInfo
          ? _value.secondaryInfo
          : secondaryInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      iconColor: freezed == iconColor
          ? _value.iconColor
          : iconColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_LovelaceCard implements _LovelaceCard {
  const _$_LovelaceCard(
      {this.type,
      this.title,
      final List<LovelaceCard>? cards,
      this.name,
      this.icon,
      this.entity,
      final List<dynamic>? entities,
      final List<MushroomChip>? chips,
      this.primaryInfo,
      this.square,
      this.columns,
      this.secondaryInfo,
      this.iconColor})
      : _cards = cards,
        _entities = entities,
        _chips = chips;

  factory _$_LovelaceCard.fromJson(Map<String, dynamic> json) =>
      _$$_LovelaceCardFromJson(json);

  @override
  final String? type;
  @override
  final String? title;
  final List<LovelaceCard>? _cards;
  @override
  List<LovelaceCard>? get cards {
    final value = _cards;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;
  @override
  final String? icon;
  @override
  final String? entity;
  final List<dynamic>? _entities;
  @override
  List<dynamic>? get entities {
    final value = _entities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MushroomChip>? _chips;
  @override
  List<MushroomChip>? get chips {
    final value = _chips;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? primaryInfo;
  @override
  final bool? square;
  @override
  final int? columns;
  @override
  final String? secondaryInfo;
  @override
  final String? iconColor;

  @override
  String toString() {
    return 'LovelaceCard(type: $type, title: $title, cards: $cards, name: $name, icon: $icon, entity: $entity, entities: $entities, chips: $chips, primaryInfo: $primaryInfo, square: $square, columns: $columns, secondaryInfo: $secondaryInfo, iconColor: $iconColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LovelaceCard &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other._entities, _entities) &&
            const DeepCollectionEquality().equals(other._chips, _chips) &&
            (identical(other.primaryInfo, primaryInfo) ||
                other.primaryInfo == primaryInfo) &&
            (identical(other.square, square) || other.square == square) &&
            (identical(other.columns, columns) || other.columns == columns) &&
            (identical(other.secondaryInfo, secondaryInfo) ||
                other.secondaryInfo == secondaryInfo) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      title,
      const DeepCollectionEquality().hash(_cards),
      name,
      icon,
      entity,
      const DeepCollectionEquality().hash(_entities),
      const DeepCollectionEquality().hash(_chips),
      primaryInfo,
      square,
      columns,
      secondaryInfo,
      iconColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LovelaceCardCopyWith<_$_LovelaceCard> get copyWith =>
      __$$_LovelaceCardCopyWithImpl<_$_LovelaceCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LovelaceCardToJson(
      this,
    );
  }
}

abstract class _LovelaceCard implements LovelaceCard {
  const factory _LovelaceCard(
      {final String? type,
      final String? title,
      final List<LovelaceCard>? cards,
      final String? name,
      final String? icon,
      final String? entity,
      final List<dynamic>? entities,
      final List<MushroomChip>? chips,
      final String? primaryInfo,
      final bool? square,
      final int? columns,
      final String? secondaryInfo,
      final String? iconColor}) = _$_LovelaceCard;

  factory _LovelaceCard.fromJson(Map<String, dynamic> json) =
      _$_LovelaceCard.fromJson;

  @override
  String? get type;
  @override
  String? get title;
  @override
  List<LovelaceCard>? get cards;
  @override
  String? get name;
  @override
  String? get icon;
  @override
  String? get entity;
  @override
  List<dynamic>? get entities;
  @override
  List<MushroomChip>? get chips;
  @override
  String? get primaryInfo;
  @override
  bool? get square;
  @override
  int? get columns;
  @override
  String? get secondaryInfo;
  @override
  String? get iconColor;
  @override
  @JsonKey(ignore: true)
  _$$_LovelaceCardCopyWith<_$_LovelaceCard> get copyWith =>
      throw _privateConstructorUsedError;
}

MushroomChip _$MushroomChipFromJson(Map<String, dynamic> json) {
  return _MushroomChip.fromJson(json);
}

/// @nodoc
mixin _$MushroomChip {
  String? get icon => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get entity => throw _privateConstructorUsedError;
  String? get contentInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MushroomChipCopyWith<MushroomChip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MushroomChipCopyWith<$Res> {
  factory $MushroomChipCopyWith(
          MushroomChip value, $Res Function(MushroomChip) then) =
      _$MushroomChipCopyWithImpl<$Res, MushroomChip>;
  @useResult
  $Res call({String? icon, String? name, String? entity, String? contentInfo});
}

/// @nodoc
class _$MushroomChipCopyWithImpl<$Res, $Val extends MushroomChip>
    implements $MushroomChipCopyWith<$Res> {
  _$MushroomChipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? name = freezed,
    Object? entity = freezed,
    Object? contentInfo = freezed,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      contentInfo: freezed == contentInfo
          ? _value.contentInfo
          : contentInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MushroomChipCopyWith<$Res>
    implements $MushroomChipCopyWith<$Res> {
  factory _$$_MushroomChipCopyWith(
          _$_MushroomChip value, $Res Function(_$_MushroomChip) then) =
      __$$_MushroomChipCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? icon, String? name, String? entity, String? contentInfo});
}

/// @nodoc
class __$$_MushroomChipCopyWithImpl<$Res>
    extends _$MushroomChipCopyWithImpl<$Res, _$_MushroomChip>
    implements _$$_MushroomChipCopyWith<$Res> {
  __$$_MushroomChipCopyWithImpl(
      _$_MushroomChip _value, $Res Function(_$_MushroomChip) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? name = freezed,
    Object? entity = freezed,
    Object? contentInfo = freezed,
  }) {
    return _then(_$_MushroomChip(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      contentInfo: freezed == contentInfo
          ? _value.contentInfo
          : contentInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MushroomChip implements _MushroomChip {
  const _$_MushroomChip({this.icon, this.name, this.entity, this.contentInfo});

  factory _$_MushroomChip.fromJson(Map<String, dynamic> json) =>
      _$$_MushroomChipFromJson(json);

  @override
  final String? icon;
  @override
  final String? name;
  @override
  final String? entity;
  @override
  final String? contentInfo;

  @override
  String toString() {
    return 'MushroomChip(icon: $icon, name: $name, entity: $entity, contentInfo: $contentInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MushroomChip &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.contentInfo, contentInfo) ||
                other.contentInfo == contentInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, icon, name, entity, contentInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MushroomChipCopyWith<_$_MushroomChip> get copyWith =>
      __$$_MushroomChipCopyWithImpl<_$_MushroomChip>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MushroomChipToJson(
      this,
    );
  }
}

abstract class _MushroomChip implements MushroomChip {
  const factory _MushroomChip(
      {final String? icon,
      final String? name,
      final String? entity,
      final String? contentInfo}) = _$_MushroomChip;

  factory _MushroomChip.fromJson(Map<String, dynamic> json) =
      _$_MushroomChip.fromJson;

  @override
  String? get icon;
  @override
  String? get name;
  @override
  String? get entity;
  @override
  String? get contentInfo;
  @override
  @JsonKey(ignore: true)
  _$$_MushroomChipCopyWith<_$_MushroomChip> get copyWith =>
      throw _privateConstructorUsedError;
}
