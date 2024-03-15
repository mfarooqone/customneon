import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferencesController extends GetxController {
  ///

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  ///

  Future<String> getString(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String val = prefs.getString(key) ?? "";
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

  // Future<void> clearEcryptedPrefs() async {
  //   await encryptedSharedPreferences.clear();
  // }

  // Future<void> remove(String key) async {
  //   // await encryptedSharedPreferences.remove(key);

  //   encryptedSharedPreferences.remove(key).then((bool success) {
  //     if (success) {
  //       encryptedSharedPreferences.setString(key, "");
  //       print('success');
  //     } else {
  //       print('fail');
  //     }
  //   });
  // }
}
