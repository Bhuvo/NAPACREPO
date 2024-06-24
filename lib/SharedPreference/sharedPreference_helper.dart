
import 'dart:convert';

import 'package:npac/model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesHelper {
  static SharePreferencesHelper? sharePreferenceHelper;
  static const String Is_login = 'Is_login';
  static const String Name = 'Name';
  static const String ID = 'user_id';
  static const String Email = 'E-Mail';
  static const String Phone = 'Phone';
  static const String AuthToken = 'Authentication_Token';
  static const String User = 'User';


  UserModel? userModel;

  static SharedPreferences? prefs;

  var UserId = SharePreferencesHelper.getInt(SharePreferencesHelper.ID);

  static SharePreferencesHelper getInstant() {
    sharePreferenceHelper ??= SharePreferencesHelper();
    return sharePreferenceHelper!;
  }

  static Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

 static String getString(String key)  {
    return prefs?.getString(key) ?? "";
  }
  static setString(String key, String value) async {
    await prefs?.setString(key, value);
  }
  static setUserString(String key, UserModel value) async {
    // await prefs?.setString(key, value);
    await prefs?.setString(key, jsonEncode(value));
  }
  static UserModel getUserString(String key)  {
    // await prefs?.setString(key, value);
   return UserModel.fromJson(jsonDecode(prefs?.getString(key) ?? "{}"));
  }
  static int getInt(String key) {
    return prefs?.getInt(key) ?? 0;
  }

  static setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  static double getDouble(String key) {
    return prefs?.getDouble(key) ?? 0.0;
  }

  static setDouble(String key, double value) {
     prefs?.setDouble(key, value);
  }


  static bool getBool(String key)  {
    return prefs?.getBool(key) ?? false;
  }

  static setBool(String key, bool value)  {
     prefs?.setBool(key, value);
  }

  static clearPreference(){
    prefs?.clear();
  }
}
