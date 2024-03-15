import 'package:customneon/screens/footer/about_us.dart';
import 'package:customneon/screens/footer/contact_us.dart';
import 'package:customneon/screens/footer/faqs.dart';
import 'package:customneon/screens/footer/payment_methods.dart';
import 'package:customneon/screens/footer/privacy_policy.dart';
import 'package:customneon/screens/footer/refund_policy.dart';
import 'package:customneon/screens/footer/shipping_policy.dart';
import 'package:customneon/screens/footer/terms_of_service.dart';
import 'package:customneon/screens/footer/track_my_order.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FooterDesign extends StatelessWidget {
  const FooterDesign({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Support",
                style: AppTextStyle.black3,
              ),
              SizedBox(height: 2.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => TrackMyOrder());
                  },
                  child: const Text("Track My Order")),
              SizedBox(height: 1.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const ShippingPolicy());
                  },
                  child: const Text("Shipping Policy")),
              SizedBox(height: 1.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const RefundPolicy());
                  },
                  child: const Text("Refund Policy")),
              SizedBox(height: 1.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const PrivacyPolicy());
                  },
                  child: const Text("Privacy Policy")),
              SizedBox(height: 1.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const TermsOfService());
                  },
                  child: const Text("Terms of Service")),
              SizedBox(height: 1.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const FAQs());
                  },
                  child: const Text("FAQs"))
              ////
              ///
              ///
              ///
            ],
          ),

          ///
          ///
          ///   second column
          ///
          ///
          ///
          SizedBox(width: 5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Information",
                style: AppTextStyle.black3,
              ),
              SizedBox(
                height: 2.5.h,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const AboutUs());
                  },
                  child: const Text("About Us")),
              SizedBox(height: 1.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const ContactUs());
                  },
                  child: const Text("Contact Us")),
              SizedBox(height: 1.5.h),
              GestureDetector(
                  onTap: () {
                    Get.to(() => const PaymentMethods());
                  },
                  child: const Text("Payment Methods"))

              ////
              ///
              ///
              ///
            ],
          ),
        ],
      ),
    );
  }
}
