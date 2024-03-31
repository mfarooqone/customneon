import 'package:customneon/controllers/contact_us_controller.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/show_messages.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:customneon/widgets/primary_button.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utills/app_text_style.dart';

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

  final ContactUsController contactUsController =
      Get.put(ContactUsController());

  ///
  ///
  ///

  ///
  ///
  ///

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
        body: SingleChildScrollView(child: Obx(() {
          return Column(
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
                      child: contactUsController.isLoading.value
                          ? const LoadingIndicator()
                          : PrimaryButton(
                              title: "Send Message",
                              onPressed: () async {
                                if (nameController.text.isEmpty) {
                                  showErrorMessage("Please enter name");
                                } else if (emailController.text.isEmpty) {
                                  showErrorMessage("Please enter email");
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text)) {
                                  showErrorMessage(
                                      "Please enter a valid email");
                                } else if (phoneNumberController.text.isEmpty) {
                                  showErrorMessage("Please enter phone number");
                                } else if (commentController.text.isEmpty) {
                                  showErrorMessage("Please enter comment");
                                } else {
                                  await contactUsController.contactUsMessage(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneNumberController.text,
                                    comment: commentController.text,
                                  );
                                }
                              },
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
          );
        })),
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
