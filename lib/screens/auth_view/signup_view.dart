import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/button_loader.dart';
import 'package:customneon/widgets/primary_button.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Obx(
      () => Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  Text("Signup",
                      style: AppTextStyle.white4.copyWith(
                          color: AppColors.orange,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Wrap(
                    children: [
                      Text("Already have an account?",
                          style: AppTextStyle.white3.copyWith(
                              color: AppColors.grey,
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SigninView());
                        },
                        child: Text(" Signin",
                            style: AppTextStyle.white3.copyWith(
                                fontSize: 5.sp, fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  textField(context, "First Name", firstNameController),
                  SizedBox(
                    height: 3.h,
                  ),
                  textField(context, "Last Name", lastNameController),
                  SizedBox(
                    height: 3.h,
                  ),
                  textField(context, "Email", emailController),
                  SizedBox(
                    height: 3.h,
                  ),
                  textField(context, "Password", passwordController),
                  SizedBox(
                    height: 3.h,
                  ),
                  textField(
                      context, "Confirm Password", confirmPasswordController),
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
                                title: "Sign up with Email",
                                onPressed: () {
                                  if (firstNameController.text.isEmpty) {
                                    AppSnackBar.showSnackBar(
                                        "Name!",
                                        "Please enter your first name",
                                        context);
                                  }

                                  ///
                                  else if (lastNameController.text.isEmpty) {
                                    AppSnackBar.showSnackBar("Name!",
                                        "Please enter your last name", context);
                                  }

                                  ///
                                  else if (emailController.text.isEmpty) {
                                    AppSnackBar.showSnackBar("Email!",
                                        "Please enter your email", context);
                                  }

                                  ///
                                  else if (passwordController.text.length < 8) {
                                    AppSnackBar.showSnackBar(
                                        "Password!",
                                        "Password must be 8 character long",
                                        context);
                                  }

                                  ///
                                  else if (confirmPasswordController.text !=
                                      passwordController.text) {
                                    AppSnackBar.showSnackBar("Password!",
                                        "Password must match", context);
                                  }

                                  ///
                                  else {
                                    authController.signup(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      displayName:
                                          "${firstNameController.text} ${lastNameController.text}",
                                    );
                                  }
                                },
                              ),
                            ),
                      SizedBox(
                        width: 2.w,
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
                                title: "Sign up with Google",
                                backgroundColor: AppColors.black,
                                isLeadingWidget: true,
                                leadingWidget: Image.asset(
                                  "assets/google_icon.png",
                                  width: 4.w,
                                  height: 4.w,
                                ),
                                onPressed: () {
                                  authController.googleSignIn(context);
                                },
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FooterDesign(),
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
