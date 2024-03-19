import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ShippingPolicy extends StatelessWidget {
  const ShippingPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Shipping Policy",
                    style: AppTextStyle.white3
                        .copyWith(color: AppColors.white, fontSize: 8.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  autoText("We offer free shipping worldwide for all orders."),
                  autoText(
                      "We partner with top carriers for smooth shipping and delivery experience, shipments will be handled by DHL Express, FedEx or UPS according to the destination."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "We ask for your understanding that we don't deliver to P.O. Boxes."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText("Order Processing"),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "Given the handcrafting nature of neon signs, please allow up to 3 business days to have your order properly produced and inspected before shipping."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText("En-Route"),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "Once the order dispatches our warehouse, it will take between 5 and 7 business before arriving at the doorstep."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText("Order Tracking"),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "Once your order is fulfilled from our side, you'll receive a shipping notification by email and / or SMS that contains the order tracking number."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "You can use tracking apps / websites accordingly to trace your order. We offer a universal whereabouts of your order, regardless of which carrier is being used."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText("Customs & Import Taxes"),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "Our customers are responsible for any customs and import taxes that may apply."),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText("Miscellaneous"),
                  SizedBox(
                    height: 2.h,
                  ),
                  autoText(
                      "There are factors that can inevitably prolong the shipping and delivery phase. While we remain committed to fulfilling orders in a timely manner, customs clearance, carrier’s transport conditions, weather conditions, global / regional public safety issues may still disturb the process."),
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
      style: AppTextStyle.white3,
    );
  }
}
