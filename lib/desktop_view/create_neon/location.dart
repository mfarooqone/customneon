import 'package:auto_size_text/auto_size_text.dart';
import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final CreateNeonController createNeonController =
      Get.put(CreateNeonController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return createNeonController.isLoading.value
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Location',
                  style: AppTextStyle.black3,
                ),

                ///
                ///
                ///
                SizedBox(
                  height: 1.h,
                ),

                ///
                ///
                ///
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          createNeonController.isOutdoor.value = true;
                          createNeonController.isLoading.value = true;
                          createNeonController.isLoading.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5.h),
                            border: Border.all(
                              color: createNeonController.isOutdoor.value
                                  ? AppColors.orange
                                  : Colors.grey,
                              width: 0.1.h,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: AutoSizeText(
                              "Outdoor",
                              style: AppTextStyle.black3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///
                    SizedBox(
                      width: 1.w,
                    ),

                    ///
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          createNeonController.isOutdoor.value = false;
                          createNeonController.isLoading.value = true;
                          createNeonController.isLoading.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5.h),
                            border: Border.all(
                              color: !createNeonController.isOutdoor.value
                                  ? AppColors.orange
                                  : Colors.grey,
                              width: 0.1.h,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: AutoSizeText(
                              "Indoor",
                              style: AppTextStyle.black3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
    });
  }
}
