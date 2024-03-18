import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our Story",
                    style: AppTextStyle.white3.copyWith(
                      color: AppColors.orange,
                      fontSize: 8.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  autoText(
                      "After a hectic day of tuning neon lights, a group of artisans sat together in their workshop, staring at the lit contours undergoing tests and pending packaging, felt proud. Soon these beautiful pieces of neon signs, big and small, white and colorful, in letters and shapes, will be delivered to doorsteps worldwide."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "What will these neon signs do, how do they change people’s life?"),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "Asked Andy, the team leader. This question turned out to be a one million one, and it laid the foundation of NeonWill, a new brand devoted to lighting up all wonderful moments in people’s life."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "Established in 2022, NeonWill is a group of neon sign enthusiasts, they are product gurus with years of expertise, marketing specialists with media know-how, customer support professionals ready to respond 24/7 … all in the belief that:"),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "1. Neon will turn whatever you’d like to say into lasting impressions;"),
                  SizedBox(
                    height: 1.h,
                  ),
                  autoText(
                      "2. Neon will bring proper vibes to all sorts of events;"),
                  SizedBox(
                    height: 1.h,
                  ),
                  autoText(
                      "3. Neon will deliver bold messages for your businesses;"),
                  SizedBox(
                    height: 1.h,
                  ),
                  autoText(
                      "4. Neon will inspire creativity to show your love and care."),
                  SizedBox(
                    height: 1.h,
                  ),
                  autoText(
                      "Our product lineup ranges from in-house neon sign designs in hundreds (and accumulating) unique styles, to neon sign templates that customers can personalize with text, shapes or photos. Furthermore, customers can use our WYSIWYG online design tool to DIY their very own neon signs from scratch, or upload an image for our team to turn it into an artwork."),
                  SizedBox(
                    height: 3.h,
                  ),
                  autoText(
                      "Every piece is crafted in good will, until then do we sign our products NeonWill."),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            FooterDesign(),
          ],
        ),
      ),
    );
  }

  Widget autoText(String text) {
    return Text(
      text,
      style: AppTextStyle.white4,
    );
  }
}
