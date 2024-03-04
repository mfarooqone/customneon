import 'package:auto_size_text/auto_size_text.dart';
import 'package:customneon/desktop_view/footer/contact_us.dart';
import 'package:customneon/desktop_view/footer/faqs.dart';
import 'package:customneon/desktop_view/footer/payment_methods.dart';
import 'package:customneon/desktop_view/footer/privacy_policy.dart';
import 'package:customneon/desktop_view/footer/refund_policy.dart';
import 'package:customneon/desktop_view/footer/about_us.dart';
import 'package:customneon/desktop_view/footer/shipping_policy.dart';
import 'package:customneon/desktop_view/footer/terms_of_service.dart';
import 'package:customneon/desktop_view/footer/track_my_order.dart';
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
              AutoSizeText(
                "Support",
                style: AppTextStyle.black3,
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => TrackMyOrder());
                },
                child: const AutoSizeText(
                  "Track My Order",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => const ShippingPolicy());
                },
                child: const AutoSizeText(
                  "Shipping Policy",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => const RefundPolicy());
                },
                child: const AutoSizeText(
                  "Refund Policy",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => const PrivacyPolicy());
                },
                child: const AutoSizeText(
                  "Privacy Policy",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => const TermsOfService());
                },
                child: const AutoSizeText(
                  "Terms of Service",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() =>  FAQs());
                },
                child: const AutoSizeText(
                  "FAQs",
                ),
              ),
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
          SizedBox(
            width: 5.w
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Information",
                style: AppTextStyle.black3,
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => const AboutUs());
                },
                child: const AutoSizeText(
                  "About Us",
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => ContactUs());
                },
                child: const AutoSizeText(
                  "Contact Us",
                ),
              ),

              MaterialButton(
                onPressed: () {
                  Get.to(() => const PaymentMethods());
                },
                child: const AutoSizeText(
                  "Payment Methods",
                ),
              )

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
