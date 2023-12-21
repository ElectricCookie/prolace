// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i11;
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:home_portal/views/screens/auth/auth_view.dart' as _i5;
import 'package:home_portal/views/screens/home/home_view.dart' as _i4;
import 'package:home_portal/views/screens/loading/loading_view.dart' as _i2;
import 'package:home_portal/views/screens/settings/entity_selector_view.dart'
    as _i6;
import 'package:home_portal/views/screens/settings/internal_ssid_view.dart'
    as _i9;
import 'package:home_portal/views/screens/settings/settings_view.dart' as _i8;
import 'package:home_portal/views/screens/setup/setup_view.dart' as _i3;
import 'package:home_portal/views/screens/view_selector/view_selector_view.dart'
    as _i7;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const loadingView = '/';

  static const setupView = '/setup-view';

  static const homeView = '/home-view';

  static const authView = '/auth-view';

  static const entitySelectorView = '/entity-selector-view';

  static const viewSelectorView = '/view-selector-view';

  static const settingsView = '/settings-view';

  static const internalSsidView = '/internal-ssid-view';

  static const all = <String>{
    loadingView,
    setupView,
    homeView,
    authView,
    entitySelectorView,
    viewSelectorView,
    settingsView,
    internalSsidView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loadingView,
      page: _i2.LoadingView,
    ),
    _i1.RouteDef(
      Routes.setupView,
      page: _i3.SetupView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i4.HomeView,
    ),
    _i1.RouteDef(
      Routes.authView,
      page: _i5.AuthView,
    ),
    _i1.RouteDef(
      Routes.entitySelectorView,
      page: _i6.EntitySelectorView,
    ),
    _i1.RouteDef(
      Routes.viewSelectorView,
      page: _i7.ViewSelectorView,
    ),
    _i1.RouteDef(
      Routes.settingsView,
      page: _i8.SettingsView,
    ),
    _i1.RouteDef(
      Routes.internalSsidView,
      page: _i9.InternalSsidView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoadingView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoadingView(),
        settings: data,
      );
    },
    _i3.SetupView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.SetupView(),
        settings: data,
      );
    },
    _i4.HomeView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.HomeView(),
        settings: data,
      );
    },
    _i5.AuthView: (data) {
      final args = data.getArgs<AuthViewArguments>(
        orElse: () => const AuthViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.AuthView(key: args.key),
        settings: data,
      );
    },
    _i6.EntitySelectorView: (data) {
      final args = data.getArgs<EntitySelectorViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.EntitySelectorView(key: args.key, selected: args.selected),
        settings: data,
      );
    },
    _i7.ViewSelectorView: (data) {
      final args = data.getArgs<ViewSelectorViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.ViewSelectorView(
            key: args.key, currentSelectedPath: args.currentSelectedPath),
        settings: data,
      );
    },
    _i8.SettingsView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.SettingsView(),
        settings: data,
      );
    },
    _i9.InternalSsidView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.InternalSsidView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AuthViewArguments {
  const AuthViewArguments({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant AuthViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class EntitySelectorViewArguments {
  const EntitySelectorViewArguments({
    this.key,
    required this.selected,
  });

  final _i11.Key? key;

  final Set<String> selected;

  @override
  String toString() {
    return '{"key": "$key", "selected": "$selected"}';
  }

  @override
  bool operator ==(covariant EntitySelectorViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.selected == selected;
  }

  @override
  int get hashCode {
    return key.hashCode ^ selected.hashCode;
  }
}

class ViewSelectorViewArguments {
  const ViewSelectorViewArguments({
    this.key,
    required this.currentSelectedPath,
  });

  final _i11.Key? key;

  final String currentSelectedPath;

  @override
  String toString() {
    return '{"key": "$key", "currentSelectedPath": "$currentSelectedPath"}';
  }

  @override
  bool operator ==(covariant ViewSelectorViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.currentSelectedPath == currentSelectedPath;
  }

  @override
  int get hashCode {
    return key.hashCode ^ currentSelectedPath.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToLoadingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loadingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.setupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthView({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.authView,
        arguments: AuthViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEntitySelectorView({
    _i11.Key? key,
    required Set<String> selected,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.entitySelectorView,
        arguments: EntitySelectorViewArguments(key: key, selected: selected),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToViewSelectorView({
    _i11.Key? key,
    required String currentSelectedPath,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.viewSelectorView,
        arguments: ViewSelectorViewArguments(
            key: key, currentSelectedPath: currentSelectedPath),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInternalSsidView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.internalSsidView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoadingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loadingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSetupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.setupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthView({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.authView,
        arguments: AuthViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEntitySelectorView({
    _i11.Key? key,
    required Set<String> selected,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.entitySelectorView,
        arguments: EntitySelectorViewArguments(key: key, selected: selected),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithViewSelectorView({
    _i11.Key? key,
    required String currentSelectedPath,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.viewSelectorView,
        arguments: ViewSelectorViewArguments(
            key: key, currentSelectedPath: currentSelectedPath),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSettingsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.settingsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInternalSsidView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.internalSsidView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
