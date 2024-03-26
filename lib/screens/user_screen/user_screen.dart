import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:customneon/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_text_style.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user';
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
    authController.isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offNamed(HomePage.routeName);
        return Future(() => true);
      },
      child: Scaffold(
        body: Obx(() {
          if (authController.isLoading.value) {
            return const LoadingIndicator();
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  const HeaderDesign(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      "Account Details",
                      style: AppTextStyle.white2
                          .copyWith(color: AppColors.white, fontSize: 8.sp),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  if (storedUser?.photoUrl != null &&
                      storedUser!.photoUrl!.isNotEmpty)
                    Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          storedUser!.photoUrl!,
                          fit: BoxFit.contain,
                        )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///
                      ///

                      ///
                      ///
                      ///

                      Text("Name", style: AppTextStyle.white2),
                      SizedBox(
                        height: 1.h,
                      ),
                      containerWidget(storedUser?.name ?? "No Name Found"),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text("Email", style: AppTextStyle.white2),

                      ///
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),

                      ///
                      containerWidget(storedUser?.email ?? "No Email Found"),

                      ///
                      SizedBox(
                        height: 3.h,
                      ),
                      Text("Address", style: AppTextStyle.white2),
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
                      SizedBox(
                        height: 2.h,
                      ),

                      ///
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FooterDesign(),
                ],
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
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(2.h),
      ),
      child: Text(
        text,
        style: AppTextStyle.white2,
      ),
    );
  }
}
