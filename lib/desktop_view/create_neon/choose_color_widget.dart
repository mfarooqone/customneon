import 'package:auto_size_text/auto_size_text.dart';
import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChooseColorWidget extends StatefulWidget {
  const ChooseColorWidget({super.key});

  @override
  State<ChooseColorWidget> createState() => _ChooseColorWidgetState();
}

class _ChooseColorWidgetState extends State<ChooseColorWidget> {
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
                  'Choose a colour',
                  style: AppTextStyle.black3,
                ),
                AutoSizeText(
                  'Minimum height required for Magic LED Neon Sign: 7cm. If color options for Magic LED Neon Sign are unavailable, please choose a larger sign size.',
                  style: AppTextStyle.black1.copyWith(color: AppColors.grey),
                ),
                SizedBox(height: 1.h),
                AutoSizeText(
                  createNeonController.getColorName(
                      selectedColor: createNeonController.selectedColor),
                  style: AppTextStyle.black3,
                ),

                ///
                ///
                ///

                ///
                ///
                ///
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 1.0.h,
                    mainAxisSpacing: 1.0.h,
                  ),
                  itemCount: createNeonController.neonColorList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        createNeonController.selectedColor =
                            createNeonController.neonColorList[index];
                        createNeonController.isLoading.value = true;
                        createNeonController.isLoading.value = false;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.5.h),
                          border: Border.all(
                            color: createNeonController.neonColorList[index] ==
                                    createNeonController.selectedColor
                                ? AppColors.orange
                                : Colors.transparent,
                            width: 0.1.h,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: createNeonController.neonColorList[index],
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
                  },
                )
              ],
            );
    });
  }
}
