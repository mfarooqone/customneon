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
      return Colors.black;
    }
  }

  Color getColorFromBackboardName({required String colorName}) {
    int index = createNeonController.backBoardColorNames.indexOf(colorName);
    if (index != -1 && index < createNeonController.backBoardColorList.length) {
      return createNeonController.backBoardColorList[index];
    } else {
      return Colors.black;
    }
  }

  ///
  ///
  ///
  Future<void> deleteCartItem({
    required String itemId,
  }) async {
    isLoading.value = true;
    var data = {"": ""};

    UserModel? storedUser = await AppPreferencesController.getUser();
    final result = await Get.find<NetworkClient>().delete(
      "/user/${storedUser!.sId!}/cart/$itemId",
      data: data,
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      await getCartData();
      showSuccessMessage("Item delete successfully");
      isLoading.value = false;
    } else {
      showErrorMessage(result.error.toString());
      isLoading.value = false;
    }
  }
}
