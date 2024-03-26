import 'package:customneon/controllers/policies_controller.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_colors.dart';

class RefundPolicy extends StatefulWidget {
  static const routeName = '/policy/refund';
  const RefundPolicy({Key? key}) : super(key: key);

  @override
  State<RefundPolicy> createState() => _RefundPolicyState();
}

class _RefundPolicyState extends State<RefundPolicy> {
  final PoliciesController policiesController = Get.put(PoliciesController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      policiesController.getRefundPolicy();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      const HeaderDesign(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Refund Policy",
                              style: AppTextStyle.white2.copyWith(
                                  color: AppColors.white, fontSize: 8.sp),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            autoText(policiesController.refundPolicy.value),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      FooterDesign(),
                    ],
                  ),
                );
        }),
      ),
    );
  }

  Widget autoText(String text) {
    return Text(
      text,
      style: AppTextStyle.white2,
    );
  }
}
