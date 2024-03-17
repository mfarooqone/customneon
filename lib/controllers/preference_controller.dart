import 'dart:convert';
import 'dart:developer';

import 'package:customneon/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferencesController extends GetxController {
  ///

  Future<void> setString({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  ///

  Future<String> getString({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String val = prefs.getString(key) ?? "";
    log("this is the value from  prefs controller $key == $val");
    return val;
  }

  ///
  Future<void> setBool({required String key, required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  ///

  Future<bool> getBool({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool val = prefs.getBool(key) ?? false;
    log("this is the value from  prefs controller $key == $val");
    return val;
  }

  ///

  Future<void> setListString(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  ///

  Future<List<String>?> getListString(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? val = prefs.getStringList(key);
    log("this is the value from  prefs controller $key == $val");
    return val;
  }

  ///
  ///
  ///
  ///
  ///
  static const String _key = 'user';
  // Save user model to SharedPreferences
  Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, json.encode(user.toJson()));
  }

  // Retrieve user model from SharedPreferences
  static Future<UserModel?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final Map<String, dynamic> map = json.decode(jsonString);
      return UserModel.fromJson(map);
    }
    return null;
  }
}
