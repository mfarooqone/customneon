import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/screens/auth_view/signup_view.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/button_loader.dart';
import 'package:customneon/widgets/primary_button.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login",
                    style: AppTextStyle.black6.copyWith(
                        color: AppColors.orange,
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 3.h,
                ),
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
                SizedBox(
                  height: 5.h,
                ),
                textField(context, "Email", emailController),
                SizedBox(
                  height: 3.h,
                ),
                textField(context, "Password", passwordController),
                SizedBox(
                  height: 2.h,
                ),
                Text("Forgot your password?",
                    style: AppTextStyle.black4
                        .copyWith(fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    authController.isLoading.value
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: const ButtonLoader(),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                            child: PrimaryButton(
                              title: "Sign in with Email",
                              onPressed: () {
                                if (emailController.text.isEmpty) {
                                  AppSnackBar.showSnackBar("Email!",
                                      "Please enter your email", context);
                                } else if (passwordController.text.isEmpty) {
                                  AppSnackBar.showSnackBar("Password!!",
                                      "Please enter your password", context);
                                } else if (passwordController.text.length < 8) {
                                  AppSnackBar.showSnackBar(
                                      "Password!!",
                                      "Password must be 8 chardcter long",
                                      context);
                                } else {
                                  authController.signin(emailController.text,
                                      passwordController.text, context);
                                }
                              },
                            ),
                          ),

                    SizedBox(
                      width: 1.w,
                    ),

                    ///
                    ///
                    ///
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: authController.isLoading.value
                          ? ButtonLoader(
                              backgroundColor: AppColors.black,
                            )
                          : PrimaryButton(
                              title: "Sign in with Google",
                              backgroundColor: AppColors.black,
                              isLeadingWidget: true,
                              leadingWidget: Image.asset(
                                "assets/google_icon.png",
                                width: 4.w,
                                height: 4.w,
                              ),
                              onPressed: () {
                                authController.googleSignIn();
                              },
                            ),
                    ),
                  ],
                ),

                ///
              ],
            ),
          ),
        ),
      ),
    );
  }

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
