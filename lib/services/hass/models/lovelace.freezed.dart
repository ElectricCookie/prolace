// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  bool? get subview => throw _privateConstructorUsedError;
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
      bool? subview,
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
    Object? subview = freezed,
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
      subview: freezed == subview
          ? _value.subview
          : subview // ignore: cast_nullable_to_non_nullable
              as bool?,
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
abstract class _$$LovelaceViewImplCopyWith<$Res>
    implements $LovelaceViewCopyWith<$Res> {
  factory _$$LovelaceViewImplCopyWith(
          _$LovelaceViewImpl value, $Res Function(_$LovelaceViewImpl) then) =
      __$$LovelaceViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? theme,
      String? title,
      List<String>? visible,
      String? path,
      String? icon,
      bool? subview,
      String? type,
      List<LovelaceCard>? cards});
}

/// @nodoc
class __$$LovelaceViewImplCopyWithImpl<$Res>
    extends _$LovelaceViewCopyWithImpl<$Res, _$LovelaceViewImpl>
    implements _$$LovelaceViewImplCopyWith<$Res> {
  __$$LovelaceViewImplCopyWithImpl(
      _$LovelaceViewImpl _value, $Res Function(_$LovelaceViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = freezed,
    Object? title = freezed,
    Object? visible = freezed,
    Object? path = freezed,
    Object? icon = freezed,
    Object? subview = freezed,
    Object? type = freezed,
    Object? cards = freezed,
  }) {
    return _then(_$LovelaceViewImpl(
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
      subview: freezed == subview
          ? _value.subview
          : subview // ignore: cast_nullable_to_non_nullable
              as bool?,
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
class _$LovelaceViewImpl implements _LovelaceView {
  const _$LovelaceViewImpl(
      {this.theme,
      this.title,
      final List<String>? visible,
      this.path,
      this.icon,
      this.subview,
      this.type,
      final List<LovelaceCard>? cards})
      : _visible = visible,
        _cards = cards;

  factory _$LovelaceViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$LovelaceViewImplFromJson(json);

  @override
  final String? theme;
  @override
  final String? title;
  final List<String>? _visible;
  @override
  List<String>? get visible {
    final value = _visible;
    if (value == null) return null;
    if (_visible is EqualUnmodifiableListView) return _visible;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? path;
  @override
  final String? icon;
  @override
  final bool? subview;
  @override
  final String? type;
  final List<LovelaceCard>? _cards;
  @override
  List<LovelaceCard>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LovelaceView(theme: $theme, title: $title, visible: $visible, path: $path, icon: $icon, subview: $subview, type: $type, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LovelaceViewImpl &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._visible, _visible) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.subview, subview) || other.subview == subview) &&
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
      subview,
      type,
      const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LovelaceViewImplCopyWith<_$LovelaceViewImpl> get copyWith =>
      __$$LovelaceViewImplCopyWithImpl<_$LovelaceViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LovelaceViewImplToJson(
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
      final bool? subview,
      final String? type,
      final List<LovelaceCard>? cards}) = _$LovelaceViewImpl;

  factory _LovelaceView.fromJson(Map<String, dynamic> json) =
      _$LovelaceViewImpl.fromJson;

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
  bool? get subview;
  @override
  String? get type;
  @override
  List<LovelaceCard>? get cards;
  @override
  @JsonKey(ignore: true)
  _$$LovelaceViewImplCopyWith<_$LovelaceViewImpl> get copyWith =>
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
  MapSource? get mapSource => throw _privateConstructorUsedError;
  LovelaceCard? get card => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get entity => throw _privateConstructorUsedError;
  String? get template => throw _privateConstructorUsedError;
  List<LovelaceCondition>? get conditions => throw _privateConstructorUsedError;
  List<dynamic>? get entities => throw _privateConstructorUsedError;
  List<MushroomChip>? get chips => throw _privateConstructorUsedError;
  String? get primaryInfo => throw _privateConstructorUsedError;
  String? get primary => throw _privateConstructorUsedError;
  String? get secondary => throw _privateConstructorUsedError;
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
      MapSource? mapSource,
      LovelaceCard? card,
      String? name,
      String? icon,
      String? entity,
      String? template,
      List<LovelaceCondition>? conditions,
      List<dynamic>? entities,
      List<MushroomChip>? chips,
      String? primaryInfo,
      String? primary,
      String? secondary,
      bool? square,
      int? columns,
      String? secondaryInfo,
      String? iconColor});

  $MapSourceCopyWith<$Res>? get mapSource;
  $LovelaceCardCopyWith<$Res>? get card;
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
    Object? mapSource = freezed,
    Object? card = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? entity = freezed,
    Object? template = freezed,
    Object? conditions = freezed,
    Object? entities = freezed,
    Object? chips = freezed,
    Object? primaryInfo = freezed,
    Object? primary = freezed,
    Object? secondary = freezed,
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
      mapSource: freezed == mapSource
          ? _value.mapSource
          : mapSource // ignore: cast_nullable_to_non_nullable
              as MapSource?,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as LovelaceCard?,
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
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<LovelaceCondition>?,
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
      primary: freezed == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as String?,
      secondary: freezed == secondary
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $MapSourceCopyWith<$Res>? get mapSource {
    if (_value.mapSource == null) {
      return null;
    }

    return $MapSourceCopyWith<$Res>(_value.mapSource!, (value) {
      return _then(_value.copyWith(mapSource: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LovelaceCardCopyWith<$Res>? get card {
    if (_value.card == null) {
      return null;
    }

    return $LovelaceCardCopyWith<$Res>(_value.card!, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LovelaceCardImplCopyWith<$Res>
    implements $LovelaceCardCopyWith<$Res> {
  factory _$$LovelaceCardImplCopyWith(
          _$LovelaceCardImpl value, $Res Function(_$LovelaceCardImpl) then) =
      __$$LovelaceCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? title,
      List<LovelaceCard>? cards,
      MapSource? mapSource,
      LovelaceCard? card,
      String? name,
      String? icon,
      String? entity,
      String? template,
      List<LovelaceCondition>? conditions,
      List<dynamic>? entities,
      List<MushroomChip>? chips,
      String? primaryInfo,
      String? primary,
      String? secondary,
      bool? square,
      int? columns,
      String? secondaryInfo,
      String? iconColor});

  @override
  $MapSourceCopyWith<$Res>? get mapSource;
  @override
  $LovelaceCardCopyWith<$Res>? get card;
}

/// @nodoc
class __$$LovelaceCardImplCopyWithImpl<$Res>
    extends _$LovelaceCardCopyWithImpl<$Res, _$LovelaceCardImpl>
    implements _$$LovelaceCardImplCopyWith<$Res> {
  __$$LovelaceCardImplCopyWithImpl(
      _$LovelaceCardImpl _value, $Res Function(_$LovelaceCardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? title = freezed,
    Object? cards = freezed,
    Object? mapSource = freezed,
    Object? card = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? entity = freezed,
    Object? template = freezed,
    Object? conditions = freezed,
    Object? entities = freezed,
    Object? chips = freezed,
    Object? primaryInfo = freezed,
    Object? primary = freezed,
    Object? secondary = freezed,
    Object? square = freezed,
    Object? columns = freezed,
    Object? secondaryInfo = freezed,
    Object? iconColor = freezed,
  }) {
    return _then(_$LovelaceCardImpl(
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
      mapSource: freezed == mapSource
          ? _value.mapSource
          : mapSource // ignore: cast_nullable_to_non_nullable
              as MapSource?,
      card: freezed == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as LovelaceCard?,
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
      template: freezed == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as String?,
      conditions: freezed == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<LovelaceCondition>?,
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
      primary: freezed == primary
          ? _value.primary
          : primary // ignore: cast_nullable_to_non_nullable
              as String?,
      secondary: freezed == secondary
          ? _value.secondary
          : secondary // ignore: cast_nullable_to_non_nullable
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
class _$LovelaceCardImpl implements _LovelaceCard {
  const _$LovelaceCardImpl(
      {this.type,
      this.title,
      final List<LovelaceCard>? cards,
      this.mapSource,
      this.card,
      this.name,
      this.icon,
      this.entity,
      this.template,
      final List<LovelaceCondition>? conditions,
      final List<dynamic>? entities,
      final List<MushroomChip>? chips,
      this.primaryInfo,
      this.primary,
      this.secondary,
      this.square,
      this.columns,
      this.secondaryInfo,
      this.iconColor})
      : _cards = cards,
        _conditions = conditions,
        _entities = entities,
        _chips = chips;

  factory _$LovelaceCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LovelaceCardImplFromJson(json);

  @override
  final String? type;
  @override
  final String? title;
  final List<LovelaceCard>? _cards;
  @override
  List<LovelaceCard>? get cards {
    final value = _cards;
    if (value == null) return null;
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MapSource? mapSource;
  @override
  final LovelaceCard? card;
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final String? entity;
  @override
  final String? template;
  final List<LovelaceCondition>? _conditions;
  @override
  List<LovelaceCondition>? get conditions {
    final value = _conditions;
    if (value == null) return null;
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _entities;
  @override
  List<dynamic>? get entities {
    final value = _entities;
    if (value == null) return null;
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MushroomChip>? _chips;
  @override
  List<MushroomChip>? get chips {
    final value = _chips;
    if (value == null) return null;
    if (_chips is EqualUnmodifiableListView) return _chips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? primaryInfo;
  @override
  final String? primary;
  @override
  final String? secondary;
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
    return 'LovelaceCard(type: $type, title: $title, cards: $cards, mapSource: $mapSource, card: $card, name: $name, icon: $icon, entity: $entity, template: $template, conditions: $conditions, entities: $entities, chips: $chips, primaryInfo: $primaryInfo, primary: $primary, secondary: $secondary, square: $square, columns: $columns, secondaryInfo: $secondaryInfo, iconColor: $iconColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LovelaceCardImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._cards, _cards) &&
            (identical(other.mapSource, mapSource) ||
                other.mapSource == mapSource) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.template, template) ||
                other.template == template) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            const DeepCollectionEquality().equals(other._entities, _entities) &&
            const DeepCollectionEquality().equals(other._chips, _chips) &&
            (identical(other.primaryInfo, primaryInfo) ||
                other.primaryInfo == primaryInfo) &&
            (identical(other.primary, primary) || other.primary == primary) &&
            (identical(other.secondary, secondary) ||
                other.secondary == secondary) &&
            (identical(other.square, square) || other.square == square) &&
            (identical(other.columns, columns) || other.columns == columns) &&
            (identical(other.secondaryInfo, secondaryInfo) ||
                other.secondaryInfo == secondaryInfo) &&
            (identical(other.iconColor, iconColor) ||
                other.iconColor == iconColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        type,
        title,
        const DeepCollectionEquality().hash(_cards),
        mapSource,
        card,
        name,
        icon,
        entity,
        template,
        const DeepCollectionEquality().hash(_conditions),
        const DeepCollectionEquality().hash(_entities),
        const DeepCollectionEquality().hash(_chips),
        primaryInfo,
        primary,
        secondary,
        square,
        columns,
        secondaryInfo,
        iconColor
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LovelaceCardImplCopyWith<_$LovelaceCardImpl> get copyWith =>
      __$$LovelaceCardImplCopyWithImpl<_$LovelaceCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LovelaceCardImplToJson(
      this,
    );
  }
}

abstract class _LovelaceCard implements LovelaceCard {
  const factory _LovelaceCard(
      {final String? type,
      final String? title,
      final List<LovelaceCard>? cards,
      final MapSource? mapSource,
      final LovelaceCard? card,
      final String? name,
      final String? icon,
      final String? entity,
      final String? template,
      final List<LovelaceCondition>? conditions,
      final List<dynamic>? entities,
      final List<MushroomChip>? chips,
      final String? primaryInfo,
      final String? primary,
      final String? secondary,
      final bool? square,
      final int? columns,
      final String? secondaryInfo,
      final String? iconColor}) = _$LovelaceCardImpl;

  factory _LovelaceCard.fromJson(Map<String, dynamic> json) =
      _$LovelaceCardImpl.fromJson;

  @override
  String? get type;
  @override
  String? get title;
  @override
  List<LovelaceCard>? get cards;
  @override
  MapSource? get mapSource;
  @override
  LovelaceCard? get card;
  @override
  String? get name;
  @override
  String? get icon;
  @override
  String? get entity;
  @override
  String? get template;
  @override
  List<LovelaceCondition>? get conditions;
  @override
  List<dynamic>? get entities;
  @override
  List<MushroomChip>? get chips;
  @override
  String? get primaryInfo;
  @override
  String? get primary;
  @override
  String? get secondary;
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
  _$$LovelaceCardImplCopyWith<_$LovelaceCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MapSource _$MapSourceFromJson(Map<String, dynamic> json) {
  return _MapSource.fromJson(json);
}

/// @nodoc
mixin _$MapSource {
  String? get camera => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapSourceCopyWith<MapSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapSourceCopyWith<$Res> {
  factory $MapSourceCopyWith(MapSource value, $Res Function(MapSource) then) =
      _$MapSourceCopyWithImpl<$Res, MapSource>;
  @useResult
  $Res call({String? camera});
}

/// @nodoc
class _$MapSourceCopyWithImpl<$Res, $Val extends MapSource>
    implements $MapSourceCopyWith<$Res> {
  _$MapSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = freezed,
  }) {
    return _then(_value.copyWith(
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapSourceImplCopyWith<$Res>
    implements $MapSourceCopyWith<$Res> {
  factory _$$MapSourceImplCopyWith(
          _$MapSourceImpl value, $Res Function(_$MapSourceImpl) then) =
      __$$MapSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? camera});
}

/// @nodoc
class __$$MapSourceImplCopyWithImpl<$Res>
    extends _$MapSourceCopyWithImpl<$Res, _$MapSourceImpl>
    implements _$$MapSourceImplCopyWith<$Res> {
  __$$MapSourceImplCopyWithImpl(
      _$MapSourceImpl _value, $Res Function(_$MapSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? camera = freezed,
  }) {
    return _then(_$MapSourceImpl(
      camera: freezed == camera
          ? _value.camera
          : camera // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapSourceImpl implements _MapSource {
  const _$MapSourceImpl({this.camera});

  factory _$MapSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapSourceImplFromJson(json);

  @override
  final String? camera;

  @override
  String toString() {
    return 'MapSource(camera: $camera)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapSourceImpl &&
            (identical(other.camera, camera) || other.camera == camera));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, camera);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapSourceImplCopyWith<_$MapSourceImpl> get copyWith =>
      __$$MapSourceImplCopyWithImpl<_$MapSourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapSourceImplToJson(
      this,
    );
  }
}

abstract class _MapSource implements MapSource {
  const factory _MapSource({final String? camera}) = _$MapSourceImpl;

  factory _MapSource.fromJson(Map<String, dynamic> json) =
      _$MapSourceImpl.fromJson;

  @override
  String? get camera;
  @override
  @JsonKey(ignore: true)
  _$$MapSourceImplCopyWith<_$MapSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LovelaceCondition _$LovelaceConditionFromJson(Map<String, dynamic> json) {
  return _LovelaceCondition.fromJson(json);
}

/// @nodoc
mixin _$LovelaceCondition {
  String? get condition => throw _privateConstructorUsedError;
  String? get entity =>
      throw _privateConstructorUsedError; // Either a string or a list of strings
  dynamic get state =>
      throw _privateConstructorUsedError; // Either a string or a list of strings
  dynamic get stateNot => throw _privateConstructorUsedError;
  String? get above => throw _privateConstructorUsedError;
  String? get below => throw _privateConstructorUsedError;
  String? get mediaQuery => throw _privateConstructorUsedError;
  List<String>? get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LovelaceConditionCopyWith<LovelaceCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LovelaceConditionCopyWith<$Res> {
  factory $LovelaceConditionCopyWith(
          LovelaceCondition value, $Res Function(LovelaceCondition) then) =
      _$LovelaceConditionCopyWithImpl<$Res, LovelaceCondition>;
  @useResult
  $Res call(
      {String? condition,
      String? entity,
      dynamic state,
      dynamic stateNot,
      String? above,
      String? below,
      String? mediaQuery,
      List<String>? users});
}

/// @nodoc
class _$LovelaceConditionCopyWithImpl<$Res, $Val extends LovelaceCondition>
    implements $LovelaceConditionCopyWith<$Res> {
  _$LovelaceConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? entity = freezed,
    Object? state = freezed,
    Object? stateNot = freezed,
    Object? above = freezed,
    Object? below = freezed,
    Object? mediaQuery = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stateNot: freezed == stateNot
          ? _value.stateNot
          : stateNot // ignore: cast_nullable_to_non_nullable
              as dynamic,
      above: freezed == above
          ? _value.above
          : above // ignore: cast_nullable_to_non_nullable
              as String?,
      below: freezed == below
          ? _value.below
          : below // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaQuery: freezed == mediaQuery
          ? _value.mediaQuery
          : mediaQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LovelaceConditionImplCopyWith<$Res>
    implements $LovelaceConditionCopyWith<$Res> {
  factory _$$LovelaceConditionImplCopyWith(_$LovelaceConditionImpl value,
          $Res Function(_$LovelaceConditionImpl) then) =
      __$$LovelaceConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? condition,
      String? entity,
      dynamic state,
      dynamic stateNot,
      String? above,
      String? below,
      String? mediaQuery,
      List<String>? users});
}

/// @nodoc
class __$$LovelaceConditionImplCopyWithImpl<$Res>
    extends _$LovelaceConditionCopyWithImpl<$Res, _$LovelaceConditionImpl>
    implements _$$LovelaceConditionImplCopyWith<$Res> {
  __$$LovelaceConditionImplCopyWithImpl(_$LovelaceConditionImpl _value,
      $Res Function(_$LovelaceConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? entity = freezed,
    Object? state = freezed,
    Object? stateNot = freezed,
    Object? above = freezed,
    Object? below = freezed,
    Object? mediaQuery = freezed,
    Object? users = freezed,
  }) {
    return _then(_$LovelaceConditionImpl(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stateNot: freezed == stateNot
          ? _value.stateNot
          : stateNot // ignore: cast_nullable_to_non_nullable
              as dynamic,
      above: freezed == above
          ? _value.above
          : above // ignore: cast_nullable_to_non_nullable
              as String?,
      below: freezed == below
          ? _value.below
          : below // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaQuery: freezed == mediaQuery
          ? _value.mediaQuery
          : mediaQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$LovelaceConditionImpl implements _LovelaceCondition {
  const _$LovelaceConditionImpl(
      {this.condition,
      this.entity,
      this.state,
      this.stateNot,
      this.above,
      this.below,
      this.mediaQuery,
      final List<String>? users})
      : _users = users;

  factory _$LovelaceConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LovelaceConditionImplFromJson(json);

  @override
  final String? condition;
  @override
  final String? entity;
// Either a string or a list of strings
  @override
  final dynamic state;
// Either a string or a list of strings
  @override
  final dynamic stateNot;
  @override
  final String? above;
  @override
  final String? below;
  @override
  final String? mediaQuery;
  final List<String>? _users;
  @override
  List<String>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LovelaceCondition(condition: $condition, entity: $entity, state: $state, stateNot: $stateNot, above: $above, below: $below, mediaQuery: $mediaQuery, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LovelaceConditionImpl &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.stateNot, stateNot) &&
            (identical(other.above, above) || other.above == above) &&
            (identical(other.below, below) || other.below == below) &&
            (identical(other.mediaQuery, mediaQuery) ||
                other.mediaQuery == mediaQuery) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      condition,
      entity,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(stateNot),
      above,
      below,
      mediaQuery,
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LovelaceConditionImplCopyWith<_$LovelaceConditionImpl> get copyWith =>
      __$$LovelaceConditionImplCopyWithImpl<_$LovelaceConditionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LovelaceConditionImplToJson(
      this,
    );
  }
}

abstract class _LovelaceCondition implements LovelaceCondition {
  const factory _LovelaceCondition(
      {final String? condition,
      final String? entity,
      final dynamic state,
      final dynamic stateNot,
      final String? above,
      final String? below,
      final String? mediaQuery,
      final List<String>? users}) = _$LovelaceConditionImpl;

  factory _LovelaceCondition.fromJson(Map<String, dynamic> json) =
      _$LovelaceConditionImpl.fromJson;

  @override
  String? get condition;
  @override
  String? get entity;
  @override // Either a string or a list of strings
  dynamic get state;
  @override // Either a string or a list of strings
  dynamic get stateNot;
  @override
  String? get above;
  @override
  String? get below;
  @override
  String? get mediaQuery;
  @override
  List<String>? get users;
  @override
  @JsonKey(ignore: true)
  _$$LovelaceConditionImplCopyWith<_$LovelaceConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MushroomChip _$MushroomChipFromJson(Map<String, dynamic> json) {
  return _MushroomChip.fromJson(json);
}

/// @nodoc
mixin _$MushroomChip {
  String? get icon => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
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
  $Res call(
      {String? icon,
      String type,
      String? name,
      String? entity,
      String? contentInfo});
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
    Object? type = null,
    Object? name = freezed,
    Object? entity = freezed,
    Object? contentInfo = freezed,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$MushroomChipImplCopyWith<$Res>
    implements $MushroomChipCopyWith<$Res> {
  factory _$$MushroomChipImplCopyWith(
          _$MushroomChipImpl value, $Res Function(_$MushroomChipImpl) then) =
      __$$MushroomChipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? icon,
      String type,
      String? name,
      String? entity,
      String? contentInfo});
}

/// @nodoc
class __$$MushroomChipImplCopyWithImpl<$Res>
    extends _$MushroomChipCopyWithImpl<$Res, _$MushroomChipImpl>
    implements _$$MushroomChipImplCopyWith<$Res> {
  __$$MushroomChipImplCopyWithImpl(
      _$MushroomChipImpl _value, $Res Function(_$MushroomChipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? type = null,
    Object? name = freezed,
    Object? entity = freezed,
    Object? contentInfo = freezed,
  }) {
    return _then(_$MushroomChipImpl(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$MushroomChipImpl implements _MushroomChip {
  const _$MushroomChipImpl(
      {this.icon,
      required this.type,
      this.name,
      this.entity,
      this.contentInfo});

  factory _$MushroomChipImpl.fromJson(Map<String, dynamic> json) =>
      _$$MushroomChipImplFromJson(json);

  @override
  final String? icon;
  @override
  final String type;
  @override
  final String? name;
  @override
  final String? entity;
  @override
  final String? contentInfo;

  @override
  String toString() {
    return 'MushroomChip(icon: $icon, type: $type, name: $name, entity: $entity, contentInfo: $contentInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MushroomChipImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.contentInfo, contentInfo) ||
                other.contentInfo == contentInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, icon, type, name, entity, contentInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MushroomChipImplCopyWith<_$MushroomChipImpl> get copyWith =>
      __$$MushroomChipImplCopyWithImpl<_$MushroomChipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MushroomChipImplToJson(
      this,
    );
  }
}

abstract class _MushroomChip implements MushroomChip {
  const factory _MushroomChip(
      {final String? icon,
      required final String type,
      final String? name,
      final String? entity,
      final String? contentInfo}) = _$MushroomChipImpl;

  factory _MushroomChip.fromJson(Map<String, dynamic> json) =
      _$MushroomChipImpl.fromJson;

  @override
  String? get icon;
  @override
  String get type;
  @override
  String? get name;
  @override
  String? get entity;
  @override
  String? get contentInfo;
  @override
  @JsonKey(ignore: true)
  _$$MushroomChipImplCopyWith<_$MushroomChipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
