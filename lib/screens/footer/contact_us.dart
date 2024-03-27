import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/widgets/primary_button.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_text_style.dart';

class ContactUs extends StatefulWidget {
  static const routeName = '/pages/contact-us';
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController commentController = TextEditingController();

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
            children: [
              const HeaderDesign(),
              Center(
                child: Text(
                  "Contact Us",
                  style: AppTextStyle.white2.copyWith(fontSize: 10.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    autoText("Contact Us"),
                    SizedBox(
                      height: 3.h,
                    ),
                    autoText(
                        "If you have any questions, please read our FAQ page for more information, or feel free to tell us your questions via the contact form, email and we will get back to you within 3 business days. (If you don't receive a reply, please check the trash box of your mailbox or write to our mailbox again)"),
                    SizedBox(
                      height: 5.h,
                    ),

                    autoText("Leave a message"),
                    SizedBox(
                      height: 3.h,
                    ),
                    textField(context, "Name", nameController),
                    SizedBox(
                      height: 3.h,
                    ),
                    textField(context, "Email", emailController),
                    SizedBox(
                      height: 3.h,
                    ),
                    textField(context, "Phone Number", phoneNumberController),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: PrimaryTextField(
                        controller: commentController,
                        hintText: "Comment",
                        maxLines: 6,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    ///
                    ///
                    ///
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: PrimaryButton(
                        title: "Send Message",
                        onPressed: () {},
                      ),
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    autoText(
                        "This site is protected by reCAPTCHA and the Google Privacy Policy and Terms of Service apply."),
                  ],
                ),
              ),

              ///
              ///
              FooterDesign(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(
      BuildContext context, String text, TextEditingController controller) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.6,
      child: PrimaryTextField(
        controller: controller,
        hintText: text,
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
