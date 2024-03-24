import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///
///
///
///

//

void showSuccessMessage(
  String message, {
  ScaffoldMessengerState? messengerState,
}) {
  final s = messengerState ?? ScaffoldMessenger.of(Get.context!);
  s.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyle.white2,
      ),
      backgroundColor: AppColors.green,
    ),
  );
}

///
///
///
void showErrorMessage(
  String message, {
  ScaffoldMessengerState? messengerState,
}) {
  final s = messengerState ?? ScaffoldMessenger.of(Get.context!);
  s.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyle.white2,
      ),
      backgroundColor: AppColors.red,
    ),
  );
}
