import 'package:shared_preferences/shared_preferences.dart';

import '../constants/stringConstants.dart';

class AppPreferences {
  setStringPreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  logoutPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  setProfileStringPreference(String token, String name, String email,
      String city, String country, dob, mobile, gender, id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token.isNotEmpty) prefs.setString(StringConstants.accessToken, token);
    prefs.setString(StringConstants.name, name);
    prefs.setString(StringConstants.email, email);
    prefs.setString(StringConstants.userId, id);
    prefs.setString(StringConstants.isLogin, id);
  }

  setBooleanPreference(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<String> getStringPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefValue = prefs.getString(key) ?? '';
    return prefValue;
  }

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(StringConstants.accessToken) ?? '';

    return token;
  }

  Future<String> getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ID = prefs.getString(StringConstants.name) ?? '';

    return ID;
  }

  Future<bool> getBoolPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool prefValue = prefs.getBool(key) ?? false;

    return prefValue;
  }
}
