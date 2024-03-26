// ignore_for_file: use_build_context_synchronously, library_prefixes

import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/network_client/network_client.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/screens/user_screen/user_screen.dart';
import 'package:customneon/utills/preference_labels.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  UserModel? userModel;

  RxBool isLoading = false.obs;

  ////
  ///
  ///
  /* -------------------------------------------------------------------------- */
  /*                                   Signin                                   */
  /* -------------------------------------------------------------------------- */

  Future<void> signInUserWithDB({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final result = await Get.find<NetworkClient>().post(
      "/signin",
      data: {'email': email, 'password': password},
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      ///
      await signinWithFirebase(
        email: email,
        password: password,
        context: context,
      );

      ///
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: true);

      ///
      final Map<String, dynamic> rawData = result.rawData;
      userModel = UserModel.fromJson(rawData);
      await prefs.saveUser(userModel!);

      ///

      Get.toNamed(UserScreen.routeName);
      showSuccessMessage("You have successfully sign in to your account");

      isLoading.value = false;
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ///
  ///
  ///
  /* -------------------------------------------------------------------------- */
  /*                                   signup                                   */
  /* -------------------------------------------------------------------------- */

  ///
  ///
  ///
  Future<void> signUpUserWithDB({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    isLoading.value = true;
    final result = await Get.find<NetworkClient>().post(
      "/signup",
      data: {"name": name, "email": email, "password": password},
      sendUserAuth: true,
    );
    if (result.isSuccess) {
      ///
      await signupWithFirebase(
        name: name,
        email: email,
        password: password,
        context: context,
      );

      ///
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: true);

      ///
      final Map<String, dynamic> rawData = result.rawData;
      userModel = UserModel.fromJson(rawData);
      await prefs.saveUser(userModel!);

      ///

      Get.toNamed(UserScreen.routeName);
      showSuccessMessage("You have successfully sign in to your account");
    } else {
      showErrorMessage(result.message!);
      isLoading.value = false;
    }
  }

  ////
  ///
  ///
  ///
  ///
  /* -------------------------------------------------------------------------- */
  /*                                  firebase signin                           */
  /* -------------------------------------------------------------------------- */
  Future<void> signinWithFirebase({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  ///
  ///

  /* -------------------------------------------------------------------------- */
  /*                               firebase signup                              */
  /* -------------------------------------------------------------------------- */

  Future<bool> signupWithFirebase({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    isLoading.value = true;
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    userCredential.user?.updateDisplayName(name);
    isLoading.value = false;
    return true;
  }

  ///
  /* -------------------------------------------------------------------------- */
  /*                                google signin                               */
  /* -------------------------------------------------------------------------- */

  ///
  ///
  ///
  Future<void> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      clientId:
          '685563662753-nitnmudrd82s6jths10u2u8l8kqp7jej.apps.googleusercontent.com',
    );

    ///
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final firebaseAuth.GoogleAuthCredential credential =
          firebaseAuth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as firebaseAuth.GoogleAuthCredential;

      // Once signed in, return the UserCredential
      await firebaseAuth.FirebaseAuth.instance.signInWithCredential(credential);

      ///
      ///
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: AppPreferencesLabels.isLogedin, value: true);

      UserModel userModel = UserModel(
        name: googleUser.displayName ?? "",
        email: googleUser.email,
        photoUrl: googleUser.photoUrl ?? "",
      );
      await prefs.saveUser(userModel);

      ///

      Get.toNamed(UserScreen.routeName);
      showSuccessMessage(
          "Success: You have successfully sign in to your account");

      ///
      ///
    } else {
      isLoading.value = false;
      showErrorMessage("Failed: Something went wrong");
    }
  }

  ///

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
    Get.offNamed(HomePage.routeName);
  }
}
