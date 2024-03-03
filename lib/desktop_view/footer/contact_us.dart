import 'package:auto_size_text/auto_size_text.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utills/app_colors.dart';
import '../../utills/app_text_style.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AutoSizeText(
                  "Contact Us",
                  style: AppTextStyle.black3
                      .copyWith(color: AppColors.black, fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              autoText("Contact Us"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "If you have any questions, please read our FAQ page for more information, or feel free to tell us your questions via the contact form, email and we will get back to you within 3 business days. (If you don't receive a reply, please check the trash box of your mailbox or write to our mailbox again)"),
              SizedBox(
                height: 5.h,
              ),
              autoText("Address:"),
              SizedBox(
                height: 3.h,
              ),
              autoText(
                  "Hong Kong (OPAY TRADING LIMITED): FLAT /RM 1502,EASEY COMMERCIAL BUILDING 253-261 HENNESSY ROAD,WAN CHAI, HONGKON"),
              SizedBox(
                height: 5.h,
              ),
              autoText("Leave a message"),
              SizedBox(
                height: 3.h,
              ),
              textField(context, "Name"),
              SizedBox(
                height: 3.h,
              ),
              textField(context, "Email"),
              SizedBox(
                height: 3.h,
              ),
              textField(context, "Phone Number"),
              SizedBox(
                height: 3.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: PrimaryTextField(
                  controller: nameController,
                  hintText: "Comment",
                  maxLines: 6,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 7,
                  child: MaterialButton(
                    color: AppColors.orange,
                    height: 9.h,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.h)),
                    onPressed: () {},
                    child: AutoSizeText(
                      "Send Message",
                      style: AppTextStyle.white4,
                    ),
                  ),
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
      ),
    );
  }

  Widget textField(BuildContext context, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.6,
      child: PrimaryTextField(
        controller: nameController,
        hintText: text,
      ),
    );
  }

  Widget autoText(String text) {
    return AutoSizeText(
      text,
      style: AppTextStyle.black4,
    );
  }
}
