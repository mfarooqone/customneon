import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TrackMyOrder extends StatelessWidget {
  TrackMyOrder({Key? key}) : super(key: key);

  final TextEditingController trackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Track My Order",
              style: AppTextStyle.black5.copyWith(color: AppColors.orange),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Row(
                children: [
                  Flexible(
                    child: PrimaryTextField(
                      controller: trackController,
                      hintText: "Tracking Number",
                    ),
                  ),
                  SizedBox(
                    width: 2.h,
                  ),
                  MaterialButton(
                    color: AppColors.orange,
                    height: 8.2.h,
                    onPressed: () {},
                    child: Text(
                      "Track",
                      style: AppTextStyle.white3,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
