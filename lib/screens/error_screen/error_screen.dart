import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ErrorScreen extends StatefulWidget {
  static const routeName = '/error';
  const ErrorScreen({Key? key}) : super(key: key);
  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        Get.offAllNamed(HomePage.routeName);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeaderDesign(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Something went wrong",
                  style: AppTextStyle.white4,
                ),
                const SizedBox(
                  height: 16,
                ),

                ///
                ///
                ///

                ///
                ///
                FooterDesign(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
