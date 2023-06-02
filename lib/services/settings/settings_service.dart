import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class SettingsService with ReactiveServiceMixin {
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

  String? get internalUrl => _prefs.getString('internalUrl');
  set internalUrl(String? value) => value == null
      ? _prefs.remove('internalUrl')
      : _prefs.setString('internalUrl', value);

  String? get externalUrl => _prefs.getString('externalUrl');
  set externalUrl(String? value) => value == null
      ? _prefs.remove('externalUrl')
      : _prefs.setString('externalUrl', value);
}
