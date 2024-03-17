import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:customneon/widgets/primary_button.dart';
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
    return WillPopScope(
      onWillPop: () {
        Get.offAll(const HomePage());
        return Future(() => true);
      },
      child: Scaffold(
        body: Obx(() {
          if (authController.isLoading.value) {
            return const LoadingIndicator();
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        Text("Name", style: AppTextStyle.black3),
                        containerWidget(
                            authController.auth.currentUser?.displayName ??
                                "No Name Found"),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text("Email", style: AppTextStyle.black3),

                        ///
                        SizedBox(
                          height: 1.h,
                        ),

                        ///
                        containerWidget(
                            authController.auth.currentUser?.email ??
                                "No Email Found"),

                        ///
                        SizedBox(
                          height: 3.h,
                        ),
                        Text("Address", style: AppTextStyle.black3),
                        SizedBox(
                          height: 1.h,
                        ),
                        containerWidget("Multan, Pakistan"),

                        ///
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: PrimaryButton(
                              title: "Edit Details", onPressed: () {}),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: PrimaryButton(
                            title: "Logout",
                            onPressed: () {},
                          ),
                        ),

                        ///
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        }),
      ),
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
