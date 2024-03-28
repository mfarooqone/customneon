import 'package:customneon/network_client/network_client.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  RxBool isLoading = false.obs;

  ///
  ///
  ///
  Future<void> contactUsMessage({
    required String name,
    required String email,
    required String phone,
    required String comment,
  }) async {
    isLoading.value = true;
    final result = await Get.find<NetworkClient>().post(
      // "http://localhost:3030/api/pages/contact-us",
      "/pages/contact-us",
      data: {
        "name": name,
        "email": email,
        "phone": phone,
        "comment": comment,
      },
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      isLoading.value = false;
      showSuccessMessage("You have successfully send your querry");
    } else {
      isLoading.value = false;
      showErrorMessage(result.message!);
    }
  }
}
