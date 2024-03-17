import 'package:customneon/utills/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        color: AppColors.orange,
      ),
      child: SpinKitCircle(
        color: AppColors.white,
        size: 3.h,
      ),
    );
  }
}
