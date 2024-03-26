import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TextAlignWidget extends StatefulWidget {
  const TextAlignWidget({super.key});

  @override
  State<TextAlignWidget> createState() => _TextAlignWidgetState();
}

class _TextAlignWidgetState extends State<TextAlignWidget> {
  final CreateNeonController createNeonController =
      Get.put(CreateNeonController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Text Align',
            maxLines: 1,
            style: AppTextStyle.white2,
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  createNeonController.selectedTextAlign.value = "left";
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      1.h,
                    ),
                    border: Border.all(
                      color:
                          createNeonController.selectedTextAlign.value == "left"
                              ? AppColors.orange
                              : AppColors.lightGrey,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Icon(
                      Icons.format_align_left,
                      size: 2.w,
                    ),
                  ),
                ),
              ),

              ///
              ///
              ///
              InkWell(
                onTap: () {
                  createNeonController.selectedTextAlign.value = "center";
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      1.h,
                    ),
                    border: Border.all(
                      color: createNeonController.selectedTextAlign.value ==
                              "center"
                          ? AppColors.orange
                          : AppColors.lightGrey,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Icon(
                      Icons.format_align_center,
                      size: 2.w,
                    ),
                  ),
                ),
              ),

              ///
              ///
              ///
              InkWell(
                onTap: () {
                  createNeonController.selectedTextAlign.value = "right";
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      1.h,
                    ),
                    border: Border.all(
                      color: createNeonController.selectedTextAlign.value ==
                              "right"
                          ? AppColors.orange
                          : AppColors.lightGrey,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Icon(
                      Icons.format_align_right,
                      size: 2.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
