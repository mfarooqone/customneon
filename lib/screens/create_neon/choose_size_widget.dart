import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChooseSizeWidget extends StatefulWidget {
  const ChooseSizeWidget({super.key});

  @override
  State<ChooseSizeWidget> createState() => _ChooseSizeWidgetState();
}

class _ChooseSizeWidgetState extends State<ChooseSizeWidget> {
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
                  'Choose a size',
                  style: AppTextStyle.white3,
                ),
                Text(
                  '*Each sign is handcrafted, and sizes shown will be accurate within 1 or 2 inches. Neon sign larger than 43 inches will be made on two or more backboards that can be easily arranged together.',
                  style: AppTextStyle.white2.copyWith(color: AppColors.grey),
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
                Wrap(
                    spacing: 18,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    runSpacing: 18,
                    children: createNeonController.sizeNames.map((e) {
                      return InkWell(
                        onTap: () {
                          createNeonController.selectedSize.value = e;
                          createNeonController.isLoading.value = true;
                          createNeonController.isLoading.value = false;
                        },
                        child: Container(
                          height: 5.h,
                          width: 5.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5.h),
                            border: Border.all(
                              color:
                                  e == createNeonController.selectedSize.value
                                      ? AppColors.orange
                                      : Colors.grey,
                              width: 0.1.h,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.h),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                e,
                                style: AppTextStyle.white2,
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
