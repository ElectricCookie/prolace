// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/screens/auth/auth_view.dart';
import '../views/screens/home/home_view.dart';
import '../views/screens/loading/loading_view.dart';
import '../views/screens/settings/entity_selector_view.dart';
import '../views/screens/settings/settings_view.dart';
import '../views/screens/setup/setup_view.dart';

class Routes {
  static const String loadingView = '/';
  static const String setupView = '/setup-view';
  static const String homeView = '/home-view';
  static const String authView = '/auth-view';
  static const String entitySelectorView = '/entity-selector-view';
  static const String settingsView = '/settings-view';
  static const all = <String>{
    loadingView,
    setupView,
    homeView,
    authView,
    entitySelectorView,
    settingsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loadingView, page: LoadingView),
    RouteDef(Routes.setupView, page: SetupView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.authView, page: AuthView),
    RouteDef(Routes.entitySelectorView, page: EntitySelectorView),
    RouteDef(Routes.settingsView, page: SettingsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoadingView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoadingView(),
        settings: data,
      );
    },
    SetupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SetupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AuthView: (data) {
      var args = data.getArgs<AuthViewArguments>(
        orElse: () => AuthViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthView(key: args.key),
        settings: data,
      );
    },
    EntitySelectorView: (data) {
      var args = data.getArgs<EntitySelectorViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => EntitySelectorView(
          key: args.key,
          selected: args.selected,
        ),
        settings: data,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AuthView arguments holder class
class AuthViewArguments {
  final Key? key;
  AuthViewArguments({this.key});
}

/// EntitySelectorView arguments holder class
class EntitySelectorViewArguments {
  final Key? key;
  final Set<String> selected;
  EntitySelectorViewArguments({this.key, required this.selected});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToLoadingView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loadingView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSetupView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.setupView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAuthView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.authView,
      arguments: AuthViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToEntitySelectorView({
    Key? key,
    required Set<String> selected,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.entitySelectorView,
      arguments: EntitySelectorViewArguments(key: key, selected: selected),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToSettingsView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.settingsView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
