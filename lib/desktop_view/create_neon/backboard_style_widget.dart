import 'package:auto_size_text/auto_size_text.dart';
import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
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
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Choose a backboard color',
                  style: AppTextStyle.black3,
                ),
                SizedBox(height: 1.h),
                AutoSizeText(
                  createNeonController.getBackBoardColorName(
                      selectedColor:
                          createNeonController.selectedBackBoardColor),
                  style: AppTextStyle.black3,
                ),

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
                  itemCount: createNeonController.backBoardColorList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        createNeonController.selectedBackBoardColor =
                            createNeonController.backBoardColorList[index];
                        createNeonController.isLoading.value = true;
                        createNeonController.isLoading.value = false;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.5.h),
                          border: Border.all(
                            color: createNeonController
                                        .backBoardColorList[index] ==
                                    createNeonController.selectedBackBoardColor
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
                              color: createNeonController
                                  .backBoardColorList[index],
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
                ),
              ],
            );
    });
  }
}
