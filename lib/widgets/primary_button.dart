import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  /// Creates a PrimaryButton.
  ///
  ///
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String title;
  final TextStyle? titleStyle;
  final VoidCallback onPressed;
  final bool enabled;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final Widget? leadingWidget;
  final bool isLeadingWidget;

  const PrimaryButton({
    Key? key,
    this.margin,
    this.padding,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.backgroundColor,
    this.titleColor,
    this.height,
    this.width,
    this.fontSize,
    this.leadingWidget,
    this.isLeadingWidget = false,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        color: enabled ? backgroundColor ?? AppColors.orange : AppColors.grey,
      ),
      child: InkWell(
        onTap: enabled ? onPressed : null,
        borderRadius: BorderRadius.circular(1.h),
        child: Container(
          width: width ?? 20.w,
          height: height ?? 6.h,
          alignment: Alignment.center,
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLeadingWidget ? leadingWidget! : const SizedBox(),
              isLeadingWidget ? SizedBox(width: 0.5.w) : const SizedBox(),
              SizedBox(
                width: 11.w,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: titleStyle ?? AppTextStyle.white2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
