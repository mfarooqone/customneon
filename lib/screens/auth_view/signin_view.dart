import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/screens/auth_view/signup_view.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:customneon/widgets/button_loader.dart';
import 'package:customneon/widgets/primary_button.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SigninView extends StatelessWidget {
  static const routeName = '/signin';
  SigninView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Obx(
      () => PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          Get.offAllNamed(HomePage.routeName);
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const HeaderDesign(),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text("Login",
                      style: AppTextStyle.white4.copyWith(
                          color: AppColors.orange,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Wrap(
                    children: [
                      Text("Don't have an account yet?",
                          style: AppTextStyle.white2.copyWith(
                              color: AppColors.grey,
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400)),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(SignupView.routeName);
                        },
                        child: Text(" Create account",
                            style: AppTextStyle.white2.copyWith(
                                fontSize: 5.sp, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textField(context, "Email", emailController),
                      SizedBox(
                        height: 3.h,
                      ),
                      textField(context, "Password", passwordController),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text("Forgot your password?",
                          textAlign: TextAlign.start,
                          style: AppTextStyle.white2
                              .copyWith(fontWeight: FontWeight.w400)),
                    ],
                  ),
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
                                    showErrorMessage(
                                        "Email!: Please enter your email");
                                  } else if (passwordController.text.isEmpty) {
                                    showErrorMessage(
                                        "Password!: Please enter your password");
                                  } else {
                                    authController.signInUserWithDB(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context,
                                    );
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
                                backgroundColor: AppColors.white,
                                titleStyle: AppTextStyle.white2
                                    .copyWith(color: AppColors.black),
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

                  SizedBox(
                    height: 10.h,
                  ),
                  FooterDesign(),

                  ///
                ],
              ),
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
