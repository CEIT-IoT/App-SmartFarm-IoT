import 'package:shared_preferences/shared_preferences.dart';

class LoginPreference {
  late SharedPreferences _preferences;
  static const email_login = 'email_login';

  Future<void> setPrefEmailLogin(String email) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(email_login, email);
  }

  Future<String?> getPrefEmailLogin() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getString(email_login);
  }
}
