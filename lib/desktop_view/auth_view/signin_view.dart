import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/desktop_view/auth_view/signup_view.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SigninView extends StatelessWidget {
  SigninView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Obx(
          () => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login",
                    style: AppTextStyle.black6.copyWith(
                        color: AppColors.orange,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 3.h),
                Wrap(
                  children: [
                    Text("Don't have an account yet?",
                        style: AppTextStyle.black3.copyWith(
                            color: AppColors.grey,
                            fontSize: 5.sp,
                            fontWeight: FontWeight.w400)),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignupView());
                      },
                      child: Text(" Create account",
                          style: AppTextStyle.black3.copyWith(
                              fontSize: 5.sp, fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                textField(context, "Email", emailController),
                SizedBox(height: 3.h),
                textField(context, "Password", passwordController),
                SizedBox(height: 2.h),
                Text("Forgot your password?",
                    style: AppTextStyle.black4
                        .copyWith(fontWeight: FontWeight.w400)),
                SizedBox(height: 5.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 7,
                  child: MaterialButton(
                    color: AppColors.orange,
                    height: 9.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.h)),
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        AppSnackBar.showSnackBar(
                            "Email!", "Please enter your email", context);
                      } else if (passwordController.text.isEmpty) {
                        AppSnackBar.showSnackBar("Password!!",
                            "Please enter your password", context);
                      } else if (passwordController.text.length < 8) {
                        AppSnackBar.showSnackBar("Password!!",
                            "Password must be 8 chardcter long", context);
                      } else {
                        authController.signin(
                            emailController.text, passwordController.text,context);
                      }
                    },
                    child: authController.isLoading.value
                        ? const Center(
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 4,
                          )),
                    )
                        : Text("Sign in".toUpperCase(),
                        style: AppTextStyle.white4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void signIn(AuthController authController) {
  //   if (emailController.text.isEmpty) {
  //     Get.snackbar("Email", "Please enter your email");
  //   } else if (passwordController.text.isEmpty) {
  //     Get.snackbar("Email", "Please enter your password");
  //   } else if (passwordController.text.length < 8) {
  //     Get.snackbar("Email", "Password must be 8 character long!");
  //   } else {
  //     authController.signin(emailController.text, passwordController.text);
  //     Get.snackbar("Success", "You have successfully login to your account");
  //   }
  // }

  Widget textField(
      BuildContext context, String text, TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.2,
      child: PrimaryTextField(
        controller: controller,
        hintText: text,
      ),
    );
  }
}
