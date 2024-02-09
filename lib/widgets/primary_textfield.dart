import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    this.heading = "",
    required this.controller,
    this.hintText,
    this.enable = true,
    this.maxLines,
    this.keyboardType,
    this.onSubmitted,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);
  final String heading;
  final TextEditingController controller;
  final String? hintText;
  final bool enable;
  final int? maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Text(
            heading,
            style: AppTextStyle.black3,
          ),
        if (heading.isNotEmpty)
          SizedBox(
            height: 1.0.h,
          ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(0.5.h),
          ),
          child: Center(
            child: TextField(
              autocorrect: true,
              enabled: enable,
              controller: controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              textAlign: TextAlign.start,
              style: AppTextStyle.black3,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
                hintStyle: AppTextStyle.black4.copyWith(color: AppColors.grey),
                hintText: hintText,
                border: InputBorder.none,
              ),
              maxLines: maxLines,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
