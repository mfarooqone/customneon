import 'package:customneon/desktop_view/auth_view/signin_view.dart';
import 'package:customneon/homepage/homepage.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<bool> signin(String email, String password, context) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.to(() => const HomePage());
      AppSnackBar.showSnackBar(
          "Success", "You have successfully signuin to your account", context);
      isLoading.value = false;
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      AppSnackBar.showSnackBar("Failed", "${e.message}", context);
      return false;
    } catch (e) {
      isLoading.value = false;
      AppSnackBar.showSnackBar(
          "Failed", "Unexpected error during sign-in: $e", context);
      return false;
    }
  }

  Future<bool> signup(String email, String password, context) async {
    try {
      isLoading.value = true;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.to(() => SigninView());
      AppSnackBar.showSnackBar(
          "Success", "You have successfully signup to your account", context);
      isLoading.value = false;
      return true;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      AppSnackBar.showSnackBar("Failed", "${e.message}", context);
      return false;
    } catch (e) {
      isLoading.value = false;
      AppSnackBar.showSnackBar(
          "Failed", "Unexpected error during sign-in: $e", context);
      return false;
    }
  }
}
