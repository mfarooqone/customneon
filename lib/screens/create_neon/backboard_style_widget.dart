import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BackboardStyleWidget extends StatefulWidget {
  const BackboardStyleWidget({super.key});

  @override
  State<BackboardStyleWidget> createState() => _BackboardStyleWidgetState();
}

class _BackboardStyleWidgetState extends State<BackboardStyleWidget> {
  final CreateNeonController createNeonController =
      Get.put(CreateNeonController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return createNeonController.isLoading.value
          ? const LoadingIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose a backboard color',
                  style: AppTextStyle.black3,
                ),
                SizedBox(height: 1.h),
                Text(
                  createNeonController.getBackBoardColorName(
                      selectedColor:
                          createNeonController.selectedBackBoardColor),
                  style: AppTextStyle.black3,
                ),

                ////
                ///
                ///
                ///
                Wrap(
                    spacing: 10,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    runSpacing: 10,
                    children: createNeonController.backBoardColorList.map((e) {
                      return InkWell(
                        onTap: () {
                          createNeonController.selectedBackBoardColor = e;
                          createNeonController.isLoading.value = true;
                          createNeonController.isLoading.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5.h),
                            border: Border.all(
                              color: e ==
                                      createNeonController
                                          .selectedBackBoardColor
                                  ? AppColors.orange
                                  : Colors.transparent,
                              width: 0.1.h,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(0.5.h),
                            child: Container(
                              height: 5.h,
                              width: 5.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: e,
                                borderRadius: BorderRadius.circular(1.h),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.1.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList()),
              ],
            );
    });
  }
}
