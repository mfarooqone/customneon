import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:customneon/widgets/primary_button.dart';
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
  final AuthController authController = Get.find();
  UserModel? storedUser;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUser();
    });
    super.initState();
  }

  void getUser() async {
    authController.isLoading.value = true;
    storedUser = await AppPreferencesController.getUser();
    if (storedUser != null) {
      print('User Display Name: ${storedUser?.displayName}');
      print('User Email: ${storedUser?.email}');
      print('User Photo URL: ${storedUser?.photoUrl}');
    }
    authController.isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.off(const HomePage());
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
                    if (storedUser?.photoUrl != null &&
                        storedUser!.photoUrl.isNotEmpty)
                      Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          storedUser!.photoUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///
                        ///

                        ///
                        ///
                        ///

                        Text("Name", style: AppTextStyle.black3),
                        containerWidget(
                            storedUser?.displayName ?? "No Name Found"),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text("Email", style: AppTextStyle.black3),

                        ///
                        SizedBox(
                          height: 1.h,
                        ),

                        ///
                        containerWidget(storedUser?.email ?? "No Email Found"),

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
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 4,
                        //   child: PrimaryButton(
                        //       title: "Edit Details", onPressed: () {}),
                        // ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          child: PrimaryButton(
                            title: "Logout",
                            onPressed: () {
                              authController.logout();
                            },
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
