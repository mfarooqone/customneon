import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static showSnackBar(
      String title, String message, BuildContext context) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          title,
        ),
        messageText: Text(
          message,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4));
  }
}
