import 'package:formletics/constants/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  static Future<bool> isAuthenticated() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final key = pref.getString(SharedPreferencesKeys.AUTH_TOKEN);
    print(key);
    print("*****************<>***********");
    if (key != null) return true;
    return false;
  }

  static Future<void> logOutUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(SharedPreferencesKeys.AUTH_TOKEN, null);
  }

  static Future<String> getAuthToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final key = pref.getString(SharedPreferencesKeys.AUTH_TOKEN);
    return key;
  }
}
