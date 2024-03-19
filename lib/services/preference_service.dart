import 'package:shared_preferences/shared_preferences.dart';

const String AUTH_TOKEN = "auth_token";

class PreferencesService {
  setAuthToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AUTH_TOKEN, token);
  }

  Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AUTH_TOKEN);
  }

  Future<bool> removeAuthToken() async {
    return (await SharedPreferences.getInstance()).remove(AUTH_TOKEN);
  }
}
