import 'package:customneon/controllers/policies_controller.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ShippingPolicy extends StatefulWidget {
  static const routeName = '/policies/shiping-policy';
  const ShippingPolicy({Key? key}) : super(key: key);

  @override
  State<ShippingPolicy> createState() => _ShippingPolicyState();
}

class _ShippingPolicyState extends State<ShippingPolicy> {
  final PoliciesController policiesController = Get.put(PoliciesController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      policiesController.getShippingPolicy();
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
                      const HeaderDesign(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            autoText(
                              policiesController.shippingPolicy.value,
                            ),
                          ],
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

  Widget autoText(String text) {
    return Text(
      text,
      style: AppTextStyle.white2,
    );
  }
}
