import 'package:customneon/desktop_view/auth_view/signin_view.dart';
import 'package:customneon/utills/app_colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
        child: Center(
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
              textField(context, "Password", passwordController),
              SizedBox(
                height: 3.h,
              ),
              textField(context, "Password", passwordController),
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
                  onPressed: () {},
                  child: Text(
                    "Sign up".toUpperCase(),
                    style: AppTextStyle.white4,
                  ),
                ),
              ),
            ],
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
