// ignore_for_file: use_build_context_synchronously

import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<bool> signup({
    required String email,
    required String password,
    required String displayName,
    required BuildContext context,
  }) async {
    try {
      isLoading.value = true;
      final userCredential = await _auth.createUserWithEmailAndPassword(
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

      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        if (kDebugMode) {
          print(userCredential.user);
        }
        if (kDebugMode) {
          print(userCredential.user!.displayName);
        }
      }

      /// save prefs data

      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: "isLogedIn", value: true);

      Get.to(() => const HomePage());
      AppSnackBar.showSnackBar(
          "Success", "You have successfully sign in to your account", context);
      isLoading.value = false;
      return true;
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
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void handleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signInSilently();

      if (account == null) {
        // Render the sign-in button using the google_sign_in_web package
        await _googleSignIn.signIn();
      } else {
        print('User Name: ${account.displayName}');
        print('User Email: ${account.email}');
        print('User Photo: ${account.photoUrl}');
      }
    } catch (error) {
      print('Error signing in: $error');
    }
  }

  ///
  ///
  ///
  // Future<User?> signInWithGoogle() async {
  //   try {
  //     await Firebase.initializeApp();
  //     FirebaseAuth auth = FirebaseAuth.instance;
  //     GoogleAuthProvider authProvider = GoogleAuthProvider();

  //     // Sign out any existing user
  //     await auth.signOut();

  //     final UserCredential userCredential =
  //         await auth.signInWithPopup(authProvider);
  //     User? user = userCredential.user;

  //     if (user != null) {
  //       final AppPreferencesController prefs = Get.find();
  //       await prefs.setBool(key: "isLoggedIn", value: true);
  //     }

  //     return user;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  ///
  ///
  ///
// uid = user.uid;
  // name = user.displayName;
  // userEmail = user.email;
  // imageUrl = user.photoURL;

  // print("name: $name");
  // print("userEmail: $userEmail");
  // print("imageUrl: $imageUrl");
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  Future<void> logout() async {
    await _auth.signOut();
    _auth.currentUser?.delete();
    Get.deleteAll();
    Get.offAll(() => const HomePage());
    final AppPreferencesController prefs = Get.find();
    await prefs.setBool(key: "isLogedIn", value: false);
  }
}
