import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_colors.dart';
import '../../utills/app_text_style.dart';

class FAQs extends StatefulWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  TextEditingController faqsTypingController = TextEditingController();

  int _selectedIndex = -1;

  List<String> faqTexts = [
    "About NeonWill",
    "Custom Signs",
    "LED Neon Signs",
    "Installation",
    "Payment & Shipping",
    "Returns & Warranty",
    "Headband"
  ];

  List<String> faqDescriptions = [
    "Who is neonwill?\n\nEstablished in 2022 by founder Andy, NeonWill embraces a sincere purpose: to lighting up all wonderful moments in people’s life. As we've grown, our focus remains unwavering. With teams in Hong Kong and the US, our brand comprises dedicated professionals—seasoned product experts, talented designers, media-savvy marketers, and 24/7 customer support - each contributing their unique expertise.\n\nOur product lineup ranges from neon sign designs in hundreds (and accumulating) unique styles, to neon sign templates that customers can personalize with text, shapes or photos. Furthermore, customers can use our WYSIWYG online design tool to DIY their very own neon signs from scratch, or upload an image for our team to turn it into an artwork.\n\nOur core offerings center around LED neon lights, a canvas we constantly innovate upon. Our commitment to bold creativity drives us to deliver the latest in neon technology and design. NeonWill isn't about grand claims; it's about authentically enhancing life's moments, one gentle glow at a time.\n\n\nHow do customers evaluate NeonWill?\n\nSince our brand's establishment, our products and services have been well-received by customers, garnering hundreds of positive reviews from various platforms. You can find our reviews through the following channels. We hope these reviews can offer assistance in your product selection process or provide inspiration for your product design.\n\nTrustpilot.com Rated 4.9\n\nFacebook Rated 5\n\nJudge.me Rated 5\n\nAdditionally, we warmly welcome customers and fans to share photos of our products on Instagram using the hashtag #neonwillglow.",
    "Can I use my own own pictures to create LED neon lights?\n\nOf course!\n\nIf you want to turn a picture or a logo into a neon sign, please upload your pictures or draft through the Upload your Image page, and we will do our best to meet your needs.\n\nWe can also print the pattern you want on the backboard by UV printing. If you have this customization requirement, please contact us for product design solutions.\n\n\n\nThe following products are made using UV printing technology and neon lights.\n\nMake your logo stand out by printing it on neon signs, adding more color and appeal, and capturing the attention of your guests.\n\nProvide us with your preferred images or designs, and we'll assist you in transforming them into neon lights. These lights can be placed in various locations, such as living rooms, dining rooms, bars, and more, illuminating your space with a unique and personal touch.",
    "How many colors are available?\n\nLED Neon Sign\n\nWe have a total of 12 colors to choose from. Our palette of 12 fluorescent neon colors is suitable for both indoor and outdoor signs.\n\nEach of our colors come with two options - white jacket or colored jacket:\n- White Tube (White Jacket) - When the sign is turned off the tubing appears white.\n\n- Colored Tube (Colored Jacket) - When the sign is turned off the tubes are still colored\n\n\n\nHere is a chart to show you the colors both on and off\n\n\nFloWill - Color Changing Neon Sign\n\nThe FloWill LED Neon Sign offers a vast array of colors and over 200 pre-set flow modes to choose from. The possibilities are endless, so let your creativity run wild with FloWill LED Neon Sign's color options!\n\n\n\nIf you need any further help selecting the color and tube for your LED Neon sign please feel free contact us at info@neonwill.com. Our team of experts will help you make the perfect choice!",
    "How should I install the neon sign?\n\nWe provide you two different installation accessories in the package, which allows you to mount the sign on the wall with nails or hang up the sign by chain. Please select the appropriate installation method based on the installation position, the size and the shape of the backboard. (Invisible Backboard Neon Sign: Wall-Mount Only)\n\n\nEasy Wall-Mounting\n\nJust in a matter of minutes it could be mounted. The neon sign comes with screws for free.\n\n1-1. Before installation, please place the product on the wall to select the positions of the holes and mark them.\n\n1-2. Make suitable holes in the wall at the marked positions.\n\n1-3. Drive expansion screws into holes in the wall.\n\n1-4. Press the product to the wall and align the holes, pass the screws through the black spacers and holes and\n\ntighten the screws.\n\n1-5. Put on the cover.",
    "What payment methods are available?\n\nPayment for all products ordered through the NeonWeill online shop is taken at the point of sale. You can choose to pay by PayPal or by using a major credit card.\n\nWe are rolling out split payment with Klarna, to date customers in the US and UK can pay over time in an interest-free manner:\n\nFor U.S. Customers: Pay in 4.\nFor UK Customers: Pay in 3.\n\nA higher initial payment may be required for some consumers. California residents: Loans made or arranged pursuant to a California Financing Law license.\n\n\nHow to check my order status?\n\n\nYour sign will be put into production after payment.\n\nOnce your order is fulfilled from our side, you'll receive a shipping notification by email and / or SMS that contains the order tracking number.\n\nYou can use tracking apps / websites accordingly to trace your order. We offer a universal tracking tool which you can just copy and paste the tracking number and track the whereabouts of your order, regardless of which carrier is being used.",
    "How long do you provide the warranty?\n\nWe offer a 24 month warranty on all LED neon lights. However, it does not include any damage caused by improper installation or artificially damage during use.\n\nIf the product is defective or there is any mistake caused by us, we will make every effort to solve the problem for you. If there is any problem with neon lights, please contact us. We will try our best to find the best solution for you!\n\n\nIf the Goods arrive in a damaged state, how should I handle it?\n\nIf the Goods arrive damaged, please inform the delivery agent and contact us within 24 hours, providing photos or videos as evidence. We're here to assist you promptly. Additionally, kindly inspect the Goods upon delivery and notify us in writing within 48 hours of any alleged defects, shortages, or damages. We'll arrange for an inspection, ensuring a fair resolution. Failure to comply may void our obligations. Your timely communication is vital to resolving any issues.\n\n\nWhat should I do if neon light goes wrong during use?\n\nWe offer a 24 - month warranty on all products. As long as your product is not artificially damaged and within the warranty period, you can email us at info@neonwill.com or contact us through contact form, and indicate your name, order number, description of the product problem, our technical assistant will contact you as soon as possible, to provide you with specific solutions.",
    "What is the size of the headband?\n\nThe headband(without the neon sign) has a height of 17cm, a width of 15cm, and weighs 180g.\n\n\nHow is the neon headband powered?\n\nBatteries power supply (batteries not included) or USB power supply(package not included). Every Neon headband comes with a battery box which can easily be stored in your pocket or back pack."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            const HeaderDesign(),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Text(
                "FREQUENTLY ASKED QUESTIONS",
                style: AppTextStyle.white3
                    .copyWith(color: AppColors.white, fontSize: 8.sp),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: PrimaryTextField(
                  controller: faqsTypingController,
                  hintText: "Start typing",
                  suffixIcon: Icon(
                    Icons.search,
                    size: 5.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    boxWidget(0),
                    SizedBox(
                      width: 3.w,
                    ),
                    boxWidget(1),
                    SizedBox(
                      width: 3.w,
                    ),
                    boxWidget(2),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    boxWidget(3),
                    SizedBox(
                      width: 3.w,
                    ),
                    boxWidget(4),
                    SizedBox(
                      width: 3.w,
                    ),
                    boxWidget(5),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(child: boxWidget(6)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      _selectedIndex == -1 ? "" : faqTexts[_selectedIndex],
                      style: AppTextStyle.white3.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                if (_selectedIndex != -1)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          faqDescriptions[_selectedIndex],
                          style: TextStyle(fontSize: 3.sp),
                        ),
                      ],
                    ),
                  ),
              ],
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

  Widget boxWidget(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(2.h),
        child: Container(
          height: 12.h,
          width: 30.h,
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                  width: 1,
                  color: _selectedIndex == index
                      ? Colors.white
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(2.h)),
          child: Center(
              child: Text(
            faqTexts[index],
            style: AppTextStyle.white3.copyWith(
                color: _selectedIndex == index ? Colors.white : Colors.white),
          )),
        ),
      ),
    );
  }
}
