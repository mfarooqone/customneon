import 'package:customneon/network_client/network_client.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:get/get.dart';

class PoliciesController extends GetxController {
  RxBool isLoading = false.obs;
  RxString privacyPolicy = ''.obs;
  RxString refundPolicy = ''.obs;
  RxString shippingPolicy = ''.obs;
  RxString aboutUs = ''.obs;
  RxString contactInfo = ''.obs;

  ///

  Future<void> getPrivacy() async {
    isLoading.value = true;

    final result = await Get.find<NetworkClient>().get(
      "/policies/privacy-policy",
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      privacyPolicy.value = result.rawData;
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ///
  ///
  Future<void> getRefundPolicy() async {
    isLoading.value = true;

    final result = await Get.find<NetworkClient>().get(
      "/policies/refund-policy",
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      refundPolicy.value = result.rawData;
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ///
  ///
  Future<void> getShippingPolicy() async {
    isLoading.value = true;

    final result = await Get.find<NetworkClient>().get(
      "/policies/shipping-policy",
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      shippingPolicy.value = result.rawData;
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ///
  ///
  Future<void> getAboutUs() async {
    isLoading.value = true;

    final result = await Get.find<NetworkClient>().get(
      "/pages/about-us",
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      aboutUs.value = result.rawData;
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ///
  ///
  Future<void> getContactInfo() async {
    isLoading.value = true;

    final result = await Get.find<NetworkClient>().get(
      "/pages/contact-info",
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      contactInfo.value = result.rawData;
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ///
}
