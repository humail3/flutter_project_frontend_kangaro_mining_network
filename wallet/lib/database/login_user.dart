// import 'package:ewages/database/shared_preferences/login_shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class LoginUser {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   LoginSharedPreferences _loginSharedPreferences = LoginSharedPreferences();
//
//   Future<bool> emailAndPasswordAuth(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       await _loginSharedPreferences.setUserLoginAtSharedPreferences(true);
//       return true;
//     } catch (e) {
//       print('Error during sign in: $e');
//       await _loginSharedPreferences.setUserLoginAtSharedPreferences(false);
//       return false;
//     }
//   }
//
//   Future<bool> checkUserLoginOrNot() async {
//     return await _loginSharedPreferences.getUserLoginFromSharedPreferences();
//   }
// }
