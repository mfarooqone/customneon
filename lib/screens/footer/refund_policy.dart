import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_colors.dart';

class RefundPolicy extends StatelessWidget {
  static const routeName = '/policy/refund';
  const RefundPolicy({Key? key}) : super(key: key);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              const HeaderDesign(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Refund Policy",
                      style: AppTextStyle.white2
                          .copyWith(color: AppColors.white, fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    autoText(
                        "We will not refund any monies paid or accept any returns for Custom Order Products."),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "If the Goods arrive to you in a damaged state, you are required to notify the delivery agent\nand us (the Seller) within 24 hours in writing inclusive of photography or a video evidence of the damage to the Goods and associated packaging to verify. Failure to comply with this request and timeframe will void our obligations."),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "You shall inspect the Goods on delivery and shall within forty-eight (48) hours of delivery notify us (the Seller) in writing of any alleged defect, shortage in quantity, damage or failure to comply with the description or quote."),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "You shall afford us an opportunity to inspect the Goods within a reasonable time following\ndelivery. If you fail to comply with these provisions, the Goods shall be conclusively presumed to be in accordance with the terms and conditions and free from any defect or damage."),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "We have a 30-day return policy, which means you have 30 days after receiving your item to request a return."),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "Since most of our neon signs are custom made, we only accept a return request when:"),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText("• item(s) arrived in a damaged state"),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText("• item(s) are found faulty; or,"),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText("• wrong item(s) are shipped."),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "To be eligible for a return, your item(s) must be in the same condition that you received them and in the original packaging. You’ll also need the receipt or proof of purchase."),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "To start a return, you can contact us at info@neonwill.com. Please note that returns will need to be\nsent to the following address:"),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "CA02 warehouse 17560 Rowland Street, City of Industry, 91748 California, USA"),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "If your return is accepted, we’ll send you a return shipping label, as well as instructions on how\nand where to send your package. Items sent back to us without first requesting a return will\nnot be accepted"),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "NeonWill shall bear all incurred shipping costs when a return is accepted."),
                    SizedBox(
                      height: 5.h,
                    ),
                    autoText(
                        "You can always contact us for any return question at info@neonwill.com."),
                    SizedBox(
                      height: 3.h,
                    ),
                    autoText(
                        "NeonWill offers a 24-month warranty that covers electrical components when used properly."),
                    SizedBox(
                      height: 3.h,
                    ),
                    autoText("Exceptions / non-returnable items"),
                    SizedBox(
                      height: 2.h,
                    ),
                    autoText(
                        "Due to the handmade nature of neon sign products, they can be subject to variations and slight discolorations. Some colors may also vary as a result from printer calibration or computer screen settings; however this should be considered an error in production since\nthese fluctuations make each item even more unique"),
                    SizedBox(
                      height: 6.h,
                    ),
                    autoText(
                        "Unfortunately, we cannot accept returns on gift cards."),
                    SizedBox(
                      height: 8.h,
                    ),
                    autoText("Exchanges"),
                    SizedBox(
                      height: 1.h,
                    ),
                    autoText(
                        "The fastest way to ensure you get what you want is to return the item you have, and once the return is accepted, make a separate purchase for the new item"),
                    SizedBox(
                      height: 5.h,
                    ),
                    autoText(
                        "European Union 14 day cooling off period\nNotwithstanding the above, if the merchandise is being shipped into the European Union, you have the right to cancel or return your order within 14 days, for any reason and without a justification. As above, your item must be in the same condition that you received it, unworn or unused, with tags, and in its original packaging. You’ll also need the receipt or proof of purchase. From the 15th day onward until the 30th day, our standard return policy applies."),
                    SizedBox(
                      height: 5.h,
                    ),
                    autoText(
                        "Refunds\nWe will notify you once we’ve received and inspected your return, and let you know if the refund was approved or not. If approved, you’ll be automatically refunded on your original payment method within 3 business days. Please remember it can take some time for your bank or credit card company to process and post the refund too."),
                    SizedBox(
                      height: 5.h,
                    ),
                    autoText(
                        "If more than 7 business days have passed since we’ve approved your return, please contact us at info@neonwill.com."),
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
