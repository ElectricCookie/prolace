import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

enum ProlaceThemeMode { light, dark, auto }

class SettingsService with ListenableServiceMixin {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<String> get screenSaverEntities =>
      _prefs.getStringList('screenSaverEntities') ?? [];

  set screenSaverEntities(List<String> value) {
    _prefs.setStringList('screenSaverEntities', value);
    notifyListeners();
  }

  bool get screenSaverEnabled => _prefs.getBool('screenSaverEnabled') ?? false;

  set screenSaverEnabled(bool value) {
    _prefs.setBool('screenSaverEnabled', value);
    notifyListeners();
  }

  String get pinnedView => _prefs.getString('pinnedView') ?? 'none';

  set pinnedView(String value) {
    _prefs.setString('pinnedView', value);
    notifyListeners();
  }

  Color get seedColor => Color(_prefs.getInt('seedColor') ?? 0xFF000000);

  set seedColor(Color value) {
    _prefs.setInt('seedColor', value.value);
    notifyListeners();
  }

  Color get seedColorDark =>
      Color(_prefs.getInt('seedColorDark') ?? 0xFF000000);

  set seedColorDark(Color value) {
    _prefs.setInt('seedColorDark', value.value);
    notifyListeners();
  }

  ProlaceThemeMode get themeMode {
    var themeMode = _prefs.getString('themeMode');
    if (themeMode == 'light') {
      return ProlaceThemeMode.light;
    } else if (themeMode == 'dark') {
      return ProlaceThemeMode.dark;
    } else {
      return ProlaceThemeMode.auto;
    }
  }

  set themeMode(ProlaceThemeMode value) {
    _prefs.setString('themeMode', value.toString().split('.').last);
    notifyListeners();
  }

  bool get allowNavigation => _prefs.getBool('allowNavigation') ?? false;

  set allowNavigation(bool value) {
    _prefs.setBool('allowNavigation', value);
    notifyListeners();
  }

  String? get internalUrl => _prefs.getString('internalUrl');
  set internalUrl(String? value) => value == null
      ? _prefs.remove('internalUrl')
      : _prefs.setString('internalUrl', value);

  String? get externalUrl => _prefs.getString('externalUrl');
  set externalUrl(String? value) => value == null
      ? _prefs.remove('externalUrl')
      : _prefs.setString('externalUrl', value);

  List<String> get internalSsids => _prefs.getStringList('internalSsids') ?? [];

  set internalSsids(List<String> value) {
    _prefs.setStringList('internalSsids', value);
    notifyListeners();
  }

  void addInternalSsid(String ssid) {
    final ssids = internalSsids;
    ssids.add(ssid);
    internalSsids = ssids;
  }

  void removeInternalSsid(String ssid) {
    final ssids = internalSsids;
    ssids.remove(ssid);
    internalSsids = ssids;
  }
}
