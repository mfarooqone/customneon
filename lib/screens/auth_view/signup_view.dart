import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_snackbar.dart';
import 'package:customneon/utills/app_text_style.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Signup",
                      style: AppTextStyle.black6.copyWith(
                          color: AppColors.orange,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 3.h,
                  ),
                  Wrap(
                    children: [
                      Text("Already have an account?",
                          style: AppTextStyle.black3.copyWith(
                              color: AppColors.grey,
                              fontSize: 5.sp,
                              fontWeight: FontWeight.w400)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SigninView());
                        },
                        child: Text(" Signin",
                            style: AppTextStyle.black3.copyWith(
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 7,
                    child: MaterialButton(
                      color: AppColors.orange,
                      height: 9.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.h)),
                      onPressed: () {
                        if (firstNameController.text.isEmpty) {
                          AppSnackBar.showSnackBar(
                              "Name!", "Please enter your first name", context);
                        }

                        ///
                        else if (lastNameController.text.isEmpty) {
                          AppSnackBar.showSnackBar(
                              "Name!", "Please enter your last name", context);
                        }

                        ///
                        else if (emailController.text.isEmpty) {
                          AppSnackBar.showSnackBar(
                              "Email!", "Please enter your email", context);
                        }

                        ///
                        else if (passwordController.text.length < 8) {
                          AppSnackBar.showSnackBar("Password!",
                              "Password must be 8 character long", context);
                        }

                        ///
                        else if (confirmPasswordController.text !=
                            passwordController.text) {
                          AppSnackBar.showSnackBar(
                              "Password!", "Password must match", context);
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
                      child: authController.isLoading.value
                          ? const Center(
                              child: SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 4,
                                ),
                              ),
                            )
                          : Text(
                              "Sign up".toUpperCase(),
                              style: AppTextStyle.white4,
                            ),
                    ),
                  ),
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
