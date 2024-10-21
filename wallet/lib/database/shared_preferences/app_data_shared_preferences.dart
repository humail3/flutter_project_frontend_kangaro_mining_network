import 'dart:async';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class AppDataSharedPreferences {
  String? _language;

  Future<void> setUserDataAtPrefs({
    String? language,
  }) async {
    if (language != null) {
      _language = language;
    }

    await saveAppDataAtPrefs();
  }

  Future<void> saveAppDataAtPrefs() async {
    final SharedPreferences appDataPrefs =
        await SharedPreferences.getInstance();
    if (_language != null) {
      await appDataPrefs.setString('language', _language!);
    }
  }

  Future<void> getUserDataFromPrefs() async {
    SharedPreferences appDataPrefs = await SharedPreferences.getInstance();

    _language = appDataPrefs.getString('language')!;
  }

  Future<void> clearAllAppDataAtPrefs() async {
    final SharedPreferences appDataPrefs =
        await SharedPreferences.getInstance();

    await appDataPrefs.clear();
  }

  Future<void> removeAllAppDataAtPrefs() async {
    final SharedPreferences appDataPrefs =
        await SharedPreferences.getInstance();

    await appDataPrefs.remove('language');
  }

  Future<void> updateAppDataAtPrefs({
    String? language,
  }) async {
    final SharedPreferences appDataPrefs =
        await SharedPreferences.getInstance();

    if (language != null) {
      await appDataPrefs.setString('language', language);
    }
  }
}
