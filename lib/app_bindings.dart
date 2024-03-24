import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/network_client/network_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

BindingsBuilder createBindings(BuildContext context) {
  return BindingsBuilder(() {
    Get.put(AppPreferencesController(), permanent: true);

    Get.put(AppPreferencesController(), permanent: true);
    Get.put<NetworkClient>(
      NetworkClient(
        getUserAuthToken: () async {
          final preference = Get.put(AppPreferencesController());
          String? authToken = await preference.getString(key: "authToken");
          return authToken;
        },
      ),
      permanent: true,
    );

    Get.put(AuthController(), permanent: true);
  });
}
