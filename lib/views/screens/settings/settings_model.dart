import 'dart:ui';

import 'package:home_portal/services/hass/models/entity.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/hass/hass_service.dart';
import '../../../services/settings/settings_service.dart';

class SettingsModel extends ReactiveViewModel {
  final _settingsService = locator<SettingsService>();
  final _hassService = locator<HassService>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_settingsService, _hassService];

  List<Entity> get entities => _hassService.entities;

  String? get internalUrl => _settingsService.internalUrl;

  String? get externalUrl => _settingsService.externalUrl;

  bool get screenSaverEnabled => _settingsService.screenSaverEnabled;

  List<String> get screenSaverEntities => _settingsService.screenSaverEntities;

  bool get allowNavigation => _settingsService.allowNavigation;

  ProlaceThemeMode get themeMode => _settingsService.themeMode;

  set themeMode(ProlaceThemeMode mode) {
    _settingsService.themeMode = mode;
  }

  Color get seedColor => _settingsService.seedColor;

  set seedColor(Color color) {
    _settingsService.seedColor = color;
  }

  Color get seedColorDark => _settingsService.seedColorDark;

  set seedColorDark(Color color) {
    _settingsService.seedColorDark = color;
  }

  String get pinnedView => _settingsService.pinnedView;

  void onChoosePinnedView() async {
    var view = await _navigationService.navigateTo(Routes.viewSelectorView,
        arguments: ViewSelectorViewArguments(currentSelectedPath: pinnedView));
    if (view != null) {
      setPinnedView(view);
    }
  }

  void setPinnedView(String view) {
    _settingsService.pinnedView = view;
  }

  void setAllowNavigation(bool allow) {
    _settingsService.allowNavigation = allow;
  }

  void setInternalUrl(String? url) {
    _settingsService.internalUrl = url;
  }

  void setExternalUrl(String? url) {
    _settingsService.externalUrl = url;
  }

  void setScreenSaverEnabled(bool enabled) {
    _settingsService.screenSaverEnabled = enabled;
  }

  void setScreenSaverEntities(List<String> entities) {
    _settingsService.screenSaverEntities = entities;
  }

  void logout() {
    _settingsService.internalUrl = null;
    _settingsService.externalUrl = null;
    _settingsService.screenSaverEnabled = false;
    _settingsService.screenSaverEntities = [];
    _settingsService.allowNavigation = false;
    _settingsService.pinnedView = "mirror";
    _navigationService.replaceWith(Routes.authView);
  }
}
