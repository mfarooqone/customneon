import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_text_style.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthController authController = Get.find();
  User? user;

  @override
  void initState() {
    user = auth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (authController.isLoading.value) {
          return const CircularProgressIndicator();
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // if (user != null)
                  //   Text(
                  //     user!.displayName ?? 'No Display Name',
                  //   ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       authController.logout();
                  //     },
                  //     child: const Text("Logout")),

                  Center(
                    child: Text(
                      "Account Details",
                      style: AppTextStyle.black3
                          .copyWith(color: AppColors.black, fontSize: 8.sp),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      autoLabelText("Name"),
                      containerWidget(
                          authController.auth.currentUser?.displayName ??
                              "No Name Found"),
                      SizedBox(
                        height: 3.h,
                      ),
                      autoLabelText("Email"),
                      SizedBox(
                        height: 1.h,
                      ),
                      containerWidget(authController.auth.currentUser?.email ??
                          "No Email Found"),
                      SizedBox(
                        height: 3.h,
                      ),
                      autoLabelText("Address"),
                      SizedBox(
                        height: 1.h,
                      ),
                      containerWidget("Multan, Pakistan"),
                      SizedBox(
                        height: 4.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: MaterialButton(
                          color: AppColors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h)),
                          height: 8.2.h,
                          onPressed: () {},
                          child: Text(
                            "Edit Details",
                            style: AppTextStyle.white3.copyWith(fontSize: 4.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: MaterialButton(
                          color: AppColors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h)),
                          height: 8.2.h,
                          onPressed: () {},
                          child: Text(
                            "Logout",
                            style: AppTextStyle.white3.copyWith(fontSize: 4.sp),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget autoLabelText(String text) {
    return Text(
      text,
      style:
          AppTextStyle.black3.copyWith(color: AppColors.black, fontSize: 5.sp),
    );
  }

  Widget containerWidget(String text) {
    return Container(
      height: 8.h,
      width: MediaQuery.of(context).size.width / 4,
      padding: EdgeInsets.only(top: 2.5.h, left: 1.w),
      decoration: BoxDecoration(
        color: Colors.cyan.shade200,
        borderRadius: BorderRadius.circular(2.h),
      ),
      child: Text(text),
    );
  }
}
