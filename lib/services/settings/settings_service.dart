import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

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
}
