// ignore_for_file: use_build_context_synchronously

import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/screens/user_screen/user_screen.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<bool> signup({
    required String email,
    required String password,
    required String displayName,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ///
      ///
      userCredential.user?.updateDisplayName(displayName);

      ///
      ///
      ///

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

  Future<bool> signin(String email, String password, context) async {
    try {
      isLoading.value = true;

      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        final AppPreferencesController prefs = Get.find();
        await prefs.setBool(key: "isLogedIn", value: true);

        UserModel userModel = UserModel(
          displayName: userCredential.user!.displayName ?? "",
          email: userCredential.user!.email ?? "",
          photoUrl: userCredential.user!.photoURL ?? "",
        );
        await prefs.saveUser(userModel);

        ///

        Get.to(() => const UserScreen());
        AppSnackBar.showSnackBar("Success",
            "You have successfully sign in to your account", context);
        isLoading.value = false;
        if (kDebugMode) {
          print(userCredential.user);
        }
        return true;
      } else {
        return false;
      }

      /// save prefs data
    } on FirebaseAuthException catch (e) {
      ///
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: "isLogedIn", value: false);

      ///
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

  ///
  ///
  ///
  void googleSignIn(BuildContext context) async {
    isLoading.value = true;
    GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '685563662753-nitnmudrd82s6jths10u2u8l8kqp7jej.apps.googleusercontent.com',

      ///
      ///
      ///
    );

    ///
    GoogleSignInAccount? user = await googleSignIn.signIn();
    if (user != null) {
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: "isLogedIn", value: true);

      UserModel userModel = UserModel(
        displayName: user.displayName ?? "",
        email: user.email,
        photoUrl: user.photoUrl ?? "",
      );
      await prefs.saveUser(userModel);

      ///

      Get.to(() => const UserScreen());
      AppSnackBar.showSnackBar(
          "Success", "You have successfully sign in to your account", context);
      isLoading.value = false;

      ///
      ///
      ///

      if (kDebugMode) {
        print(user);
      }
    } else {
      isLoading.value = false;
      AppSnackBar.showSnackBar("Error", "Something went wrong", context);
    }
  }

  ///
  ///
  ///
  Future<void> logout() async {
    await auth.signOut();
    auth.currentUser?.delete();
    Get.deleteAll();
    final AppPreferencesController prefs = Get.find();
    await prefs.setBool(key: "isLogedIn", value: false);
    prefs.clearData();
    Get.offAll(() => const HomePage());
  }
}
