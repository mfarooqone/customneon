import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

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

  Future<bool> signin(String email, String password, context) async {
    try {
      isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      ///
      ///
      /// save prefs data
      ///
      ///
      final AppPreferencesController prefs = Get.find();
      await prefs.setBool(key: "isLogedIn", value: true);

      ///
      ///
      ///
      bool dd = await prefs.getBool(key: "isLogedIn");
      print("is loged in -==  $dd");

      ///

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
  ///
  Future<User?> signInWithGoogle() async {
    await Firebase.initializeApp();
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;

    GoogleAuthProvider authProvider = GoogleAuthProvider();

    try {
      final UserCredential userCredential =
          await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    if (user != null) {
      // uid = user.uid;
      // name = user.displayName;
      // userEmail = user.email;
      // imageUrl = user.photoURL;

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('auth', true);
      // print("name: $name");
      // print("userEmail: $userEmail");
      // print("imageUrl: $imageUrl");
    }
    return user;
  }
}
