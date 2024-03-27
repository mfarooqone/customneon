import 'package:customneon/controllers/policies_controller.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utills/app_colors.dart';
import '../../../utills/app_text_style.dart';

class PrivacyPolicy extends StatefulWidget {
  static const routeName = '/policies/privacy-policy';
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  final PoliciesController policiesController = Get.put(PoliciesController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      policiesController.getPrivacy();
    });
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
        body: Obx(() {
          return policiesController.isLoading.value
              ? const LoadingIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const HeaderDesign(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 10.h),
                        child: autoText(
                          policiesController.privacyPolicy.value,
                        ),
                      ),
                      FooterDesign(),
                    ],
                  ),
                );
        }),
      ),
    );
  }

  Widget autoLabelText(String text) {
    return Text(
      text,
      style:
          AppTextStyle.white2.copyWith(color: AppColors.white, fontSize: 8.sp),
    );
  }

  Widget autoText(String text) {
    return Text(
      text,
      style: AppTextStyle.white2,
    );
  }
}
