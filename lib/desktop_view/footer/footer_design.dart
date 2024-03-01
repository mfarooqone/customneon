import 'package:auto_size_text/auto_size_text.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FooterDesign extends StatelessWidget {
  const FooterDesign({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightGrey,
      height: 50.h,
      child: Row(
        children: [
          Column(
            children: [
              AutoSizeText(
                "Support",
                style: AppTextStyle.black3,
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Track My Order",
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Shipping Policy",
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Refund Policy",
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Privacy Policy",
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "Terms of Service",
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const AutoSizeText(
                  "FAQs",
                ),
              ),
              ////
              ///
              ///
              ///
            ],
          )
        ],
      ),
    );
  }
}
