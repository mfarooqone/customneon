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
  final VoidCallback onPressed;
  final bool enabled;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final IconData? icon;
  final bool isIcon;

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
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Material(
        borderRadius: BorderRadius.circular(1.h),
        color: enabled ? backgroundColor ?? AppColors.orange : AppColors.grey,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(1.h),
          child: Container(
            width: width ?? double.infinity,
            height: height ?? 6.h,
            alignment: Alignment.center,
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isIcon
                    ? Icon(
                        icon,
                        color: AppColors.white,
                      )
                    : const SizedBox(),
                isIcon ? const SizedBox(width: 11) : const SizedBox(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.white2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
