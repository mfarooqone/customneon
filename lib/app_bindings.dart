import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

BindingsBuilder createBindings(BuildContext context) {
  return BindingsBuilder(() {
    Get.put(AppPreferencesController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  });
}
