import 'package:home_portal/services/hass/models/entity.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/hass/hass_service.dart';
import '../../../services/settings/settings_service.dart';

class SettingsModel extends ReactiveViewModel {
  final _settingsService = locator<SettingsService>();
  final _hassService = locator<HassService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_settingsService, _hassService];

  List<Entity> get entities => _hassService.entities;

  String? get internalUrl => _settingsService.internalUrl;

  String? get externalUrl => _settingsService.externalUrl;

  bool get screenSaverEnabled => _settingsService.screenSaverEnabled;

  List<String> get screenSaverEntities => _settingsService.screenSaverEntities;

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
}
