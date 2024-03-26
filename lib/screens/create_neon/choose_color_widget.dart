import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/loading_indicator.dart';
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
          ? const LoadingIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose a colour',
                  style: AppTextStyle.white2,
                ),
                Text(
                  'Minimum height required for Magic LED Neon Sign: 7cm. If color options for Magic LED Neon Sign are unavailable, please choose a larger sign size.',
                  style: AppTextStyle.white2.copyWith(color: AppColors.grey),
                ),
                SizedBox(height: 1.h),
                Text(
                  createNeonController.getColorName(
                      selectedColor: createNeonController.selectedColor),
                  style: AppTextStyle.white2,
                ),

                ///
                ///
                Wrap(
                    spacing: 5,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    runSpacing: 5,
                    children: createNeonController.neonColorList.map((e) {
                      return InkWell(
                        onTap: () {
                          createNeonController.selectedColor = e;
                          createNeonController.isLoading.value = true;
                          createNeonController.isLoading.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5.h),
                            border: Border.all(
                              color: e == createNeonController.selectedColor
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

                ///
                ///
                ///
                ///
                ///
                // GridView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   padding: EdgeInsets.zero,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 4,
                //     childAspectRatio: 3 / 2,
                //     crossAxisSpacing: 1.0.h,
                //     mainAxisSpacing: 1.0.h,
                //   ),
                //   itemCount: createNeonController.neonColorList.length,
                //   itemBuilder: (BuildContext ctx, index) {
                //     return InkWell(
                //       onTap: () {
                //         createNeonController.selectedColor =
                //             createNeonController.neonColorList[index];
                //         createNeonController.isLoading.value = true;
                //         createNeonController.isLoading.value = false;
                //       },
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(0.5.h),
                //           border: Border.all(
                //             color: createNeonController.neonColorList[index] ==
                //                     createNeonController.selectedColor
                //                 ? AppColors.orange
                //                 : Colors.transparent,
                //             width: 0.1.h,
                //           ),
                //         ),
                //         child: Padding(
                //           padding: EdgeInsets.all(1.h),
                //           child: Container(
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //               color: createNeonController.neonColorList[index],
                //               borderRadius: BorderRadius.circular(1.h),
                //               border: Border.all(
                //                 color: Colors.grey,
                //                 width: 0.1.h,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // )
              ],
            );
    });
  }
}
