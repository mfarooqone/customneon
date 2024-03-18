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
import 'package:customneon/utills/image_path.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class FooterDesign extends StatelessWidget {
  FooterDesign({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      height: 80.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.h, left: 10.h, top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Subscribe & Save"),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: PrimaryTextField(
                        controller: emailController,
                        hintText: "Enter email here",
                        suffixIcon: const Icon(Icons.forward),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const Text(
                        "Sign up for exclusive deals, including a unique\ncoupon for \$30 OFF your first order."),
                    SizedBox(
                      height: 4.h,
                    ),
                    const Text("Stay Connected"),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        assetImage(AppImagePath.facebookIcon),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        assetImage(AppImagePath.pinterestIcon),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        assetImage(AppImagePath.instagramIcon),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        assetImage(AppImagePath.youtubeIcon),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          const Divider(
            color: Colors.black,
              thickness: 0.5,
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.h, left: 10.h),
            child: const Text("© 2024, NeonWill. All rights reserved."),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text("")
        ],
      ),
    );
  }

  Widget assetImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2.h),
      child: Image(image: AssetImage(image), height: 3.5.h, fit: BoxFit.fill),
    );
  }
}
