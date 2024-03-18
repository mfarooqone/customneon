import 'package:customneon/screens/footer/footer_design.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_text_style.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: [
             Padding(
               padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   autoText("Payment Methods", AppTextStyle.black4),
                   SizedBox(
                     height: 3.h,
                   ),
                   autoText("We accept payments of major credit cards and PayPal.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 3.h,
                   ),
                   autoText("PAYING WITH CREDIT CARD", AppTextStyle.black4),
                   SizedBox(
                     height: 3.h,
                   ),
                   autoText(
                       "You can pay with credit card (American Express, Mastercard, Visa and JCB).",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "Please note that NeonWill does not collect your credit/debit card number or personal information when you make a payment.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "For questions regarding your transactions on our site, please consult your card-issuing bank for information.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 3.h,
                   ),
                   autoText("SPLIT PAYMENTS WITH KLARNA", AppTextStyle.black4),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "You can pay with credit card (American Express, Mastercard, Visa and JCB).",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "We are rolling out split payment with Klarna, to date customers in the US and UK can pay over time in an interest-free manner:",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       " • For U.S. Customers: Pay in 4.\n • For UK Customers: Pay in 3.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "A higher initial payment may be required for some consumers. California residents: Loans made or arranged pursuant to a California Financing Law license.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 3.h,
                   ),
                   autoText("PAYING WITH PAYPAL", AppTextStyle.black4),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "PayPal is a secure and trusted payment method for online shopping.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "With PayPal, you can send payment quickly and securely on-line.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "Through PayPal, you can pay with credit card (American Express, Mastercard, Visa), debit card, or bank account balance even if you do not have a Paypal account.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "Once your order is submitted, you will be redirected to PayPal to complete the transaction. You can trace the status of your payment using your PayPal account.",
                       AppTextStyle.black3),
                   SizedBox(
                     height: 5.h,
                   ),
                   autoText("Express Checkout Experience", AppTextStyle.black4),
                   SizedBox(
                     height: 3.h,
                   ),
                   autoText(
                       "Customer may also be able to checkout using Apple Pay, Google Pay, or Shop Pay.",
                       AppTextStyle.black4),
                   SizedBox(
                     height: 2.h,
                   ),
                   autoText(
                       "The eligibility of such express experience varies per customers' locations.",
                       AppTextStyle.black4),
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

  Widget autoText(String text, TextStyle style) {
    return Text(
      text,
      style: style,
    );
  }
}
