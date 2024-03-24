// ignore_for_file: use_build_context_synchronously

import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/network_client/network_client.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/screens/user_screen/user_screen.dart';
import 'package:customneon/utills/preference_labels.dart';
import 'package:customneon/utills/show_messages.dart';
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
      showSuccessMessage(
          "Success: You have successfully signup to your account");

      isLoading.value = false;
      return true;
    } on FirebaseAuthException catch (e) {
      ///
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: false);

      ///
      isLoading.value = false;
      showErrorMessage("Failed:  ${e.message}");

      return false;
    } catch (e) {
      isLoading.value = false;
      showErrorMessage("Failed: Unexpected error during sign-in: $e");
      return false;
    }
  }

  Future<bool> signin(String email, String password, context) async {
    try {
      isLoading.value = true;

      final userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        await signInUserWithDB(
          context: context,
          email: email,
          password: password,
        );
        final AppPreferencesController prefs = Get.find();
        await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: true);

        UserModel userModel = UserModel(
          displayName: userCredential.user!.displayName ?? "",
          email: userCredential.user!.email ?? "",
          photoUrl: userCredential.user!.photoURL ?? "",
        );
        await prefs.saveUser(userModel);

        ///

        Get.to(() => const UserScreen());
        showSuccessMessage("You have successfully sign in to your account");
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
      await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: false);

      ///
      isLoading.value = false;
      showErrorMessage("Failed:  ${e.message}");

      return false;
    } catch (e) {
      isLoading.value = false;
      showErrorMessage("Failed: Unexpected error during sign-in: $e");
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
    );

    ///
    GoogleSignInAccount? user = await googleSignIn.signIn();
    if (user != null) {
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: true);

      UserModel userModel = UserModel(
        displayName: user.displayName ?? "",
        email: user.email,
        photoUrl: user.photoUrl ?? "",
      );
      await prefs.saveUser(userModel);

      // await prefs.setString(key: "authToken", value: "");

      ///

      Get.to(() => const UserScreen());
      showSuccessMessage(
          "Success: You have successfully sign in to your account");

      isLoading.value = false;

      ///
      ///
      ///

      if (kDebugMode) {
        print(user);
      }
    } else {
      isLoading.value = false;
      showErrorMessage("Failed: Something went wrong");
    }
  }

  ///
  ///
  ///
  ///
  Future<void> signInUserWithDB({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final result = await Get.find<NetworkClient>().post(
      "/signin",
      data: {
        'email': email,
        'password': password,
      },
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
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
    await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: false);
    prefs.clearData();
    Get.offAll(() => const HomePage());
  }
}
