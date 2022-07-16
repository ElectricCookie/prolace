import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
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
