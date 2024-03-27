import 'package:customneon/screens/footer/contact_us.dart';
import 'package:customneon/screens/footer/faqs.dart';
import 'package:customneon/screens/footer/pages/about_us.dart';
import 'package:customneon/screens/footer/pages/contact_info.dart';
import 'package:customneon/screens/footer/payment_methods.dart';
import 'package:customneon/screens/footer/policies/privacy_policy.dart';
import 'package:customneon/screens/footer/policies/refund_policy.dart';
import 'package:customneon/screens/footer/policies/shipping_policy.dart';
import 'package:customneon/screens/footer/terms_of_service.dart';
import 'package:customneon/screens/footer/track_my_order.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/utills/image_path.dart';
import 'package:customneon/widgets/primary_textfield.dart';
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
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Support",
                      style: AppTextStyle.white3,
                    ),
                    SizedBox(height: 2.5.h),
                    InkWell(
                      onTap: () {
                        Get.toNamed(TrackMyOrder.routeName);
                      },
                      child: Text(
                        "Track My Order",
                        style: AppTextStyle.white2,
                      ),
                    ),

                    ///
                    SizedBox(height: 1.5.h),
                    InkWell(
                      onTap: () {
                        Get.toNamed(FAQs.routeName);
                      },
                      child: Text(
                        "FAQs",
                        style: AppTextStyle.white2,
                      ),
                    ),

                    ///
                    SizedBox(height: 1.5.h),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AboutUs.routeName);
                      },
                      child: Text(
                        "About Us",
                        style: AppTextStyle.white2,
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    InkWell(
                      onTap: () {
                        Get.toNamed(ContactUs.routeName);
                      },
                      child: Text(
                        "Contact Us",
                        style: AppTextStyle.white2,
                      ),
                    ),

                    SizedBox(height: 1.5.h),
                    InkWell(
                      onTap: () {
                        Get.toNamed(PaymentMethods.routeName);
                      },
                      child: Text(
                        "Payment Methods",
                        style: AppTextStyle.white2,
                      ),
                    )
                    ////
                    ///
                    ///
                    ///
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.5.h),
                    Text(
                      "Subscribe & Save",
                      style: AppTextStyle.white2,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: 10.w,
                      child: PrimaryTextField(
                        controller: emailController,
                        hintText: "Enter email here",
                        suffixIcon: const Icon(Icons.forward),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: 10.w,
                      child: Text(
                        "Sign up for exclusive deals, including a unique coupon for \$30 OFF your first order.",
                        style: AppTextStyle.white2,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Stay Connected",
                      style: AppTextStyle.white2,
                    ),
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
            color: Colors.white,
            thickness: 0.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Text(
              "© 2024, CustomsNeon. All rights reserved.",
              style: AppTextStyle.white2,
            ),
          ),

          ///
          SizedBox(height: 2.h),

          ///
          ///
          ///
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Wrap(
              spacing: 10,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              runSpacing: 10,
              children: [
                ///
                InkWell(
                  onTap: () {
                    Get.toNamed(RefundPolicy.routeName);
                  },
                  child: Text(
                    "Refund Policy",
                    style: AppTextStyle.white1,
                  ),
                ),

                ///
                InkWell(
                  onTap: () {
                    Get.toNamed(PrivacyPolicy.routeName);
                  },
                  child: Text(
                    "Privacy Policy",
                    style: AppTextStyle.white1,
                  ),
                ),

                ///

                InkWell(
                  onTap: () {
                    Get.toNamed(TermsOfService.routeName);
                  },
                  child: Text(
                    "Terms of Service",
                    style: AppTextStyle.white2,
                  ),
                ),

                ///
                InkWell(
                  onTap: () {
                    Get.toNamed(ShippingPolicy.routeName);
                  },
                  child: Text(
                    "Shipping Policy",
                    style: AppTextStyle.white1,
                  ),
                ),

                ///
                InkWell(
                  onTap: () {
                    Get.toNamed(ContactInfo.routeName);
                  },
                  child: Text(
                    "Contact Info",
                    style: AppTextStyle.white2,
                  ),
                ),

                ///
              ],
            ),
          ),

          ///
          SizedBox(height: 2.h),
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
