import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPreferences{

  Future<void> setUserLoginAtSharedPreferences(bool value) async {
    final SharedPreferences prefsLogin = await SharedPreferences.getInstance();
    await prefsLogin.setBool('loginUser', value);
  }

  Future<bool> getUserLoginFromSharedPreferences() async {
    final SharedPreferences prefsLogin = await SharedPreferences.getInstance();
    try {
      bool? login = prefsLogin.getBool('loginUser');
      return login ?? false;
    } catch (e) {
      print('Error reading login status: $e');
      return false;
    }
  }
}