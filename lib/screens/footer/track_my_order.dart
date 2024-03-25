import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/widgets/primary_button.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrackMyOrder extends StatelessWidget {
  TrackMyOrder({Key? key}) : super(key: key);

  final TextEditingController trackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.h,
            ),
            const HeaderDesign(),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 14.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: PrimaryTextField(
                      heading: "Track My Order",
                      controller: trackController,
                      hintText: "Tracking Number",
                    ),
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  SizedBox(
                    width: 12.w,
                    child: Flexible(
                      child: PrimaryButton(title: "Track", onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            FooterDesign(),
          ],
        ),
      ),
    );
  }
}
