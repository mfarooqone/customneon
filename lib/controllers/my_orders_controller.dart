import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/cart_model.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/network_client/network_client.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  RxBool isLoading = false.obs;

  List<CartModel> ordersList = [];

  ///
  ///
  ///
  ///

  Future<void> getOrdersData() async {
    isLoading.value = true;

    UserModel? storedUser = await AppPreferencesController.getUser();
    final result = await Get.find<NetworkClient>().get(
      "/user/${storedUser!.sId!}/cart",
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      ordersList.clear();
      List jsonResponse = result.rawData;
      ordersList = jsonResponse.map((job) => CartModel.fromJson(job)).toList();

      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ///
  ///
  Future<void> addOrder({
    required String itemId,
  }) async {
    isLoading.value = true;

    UserModel? storedUser = await AppPreferencesController.getUser();
    final result = await Get.find<NetworkClient>().post(
      "/user/${storedUser!.sId!}/purchase/$itemId",
      data: {},
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      showSuccessMessage(result.message!);
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }
}
