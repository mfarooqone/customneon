import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/cart_model.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/network_client/network_client.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxBool isLoading = false.obs;

  final CreateNeonController createNeonController = Get.find();

  CartModel? cartModel;

  Future<void> getCartData() async {
    isLoading.value = true;

    UserModel? storedUser = await AppPreferencesController.getUser();

    final result = await Get.find<NetworkClient>().get(
      "/user/${storedUser!.sId!}/cart",
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      ///
      final Map<String, dynamic> rawData = result.rawData;
      cartModel = CartModel.fromJson(rawData);

      ///
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);

      isLoading.value = false;
    }
  }

  ///
  ///
  ///
  ///
  Color getColorFromName({required String colorName}) {
    int index = createNeonController.neonColorNames.indexOf(colorName);
    if (index != -1 && index < createNeonController.neonColorList.length) {
      return createNeonController.neonColorList[index];
    } else {
      // Return a default color or handle the case as per your requirement
      return Colors.black; // for example
    }
  }
}
