import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BackboardColorWidget extends StatefulWidget {
  const BackboardColorWidget({super.key});

  @override
  State<BackboardColorWidget> createState() => _BackboardColorWidgetState();
}

class _BackboardColorWidgetState extends State<BackboardColorWidget> {
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
                Text(
                  'Backboard Style',
                  style: AppTextStyle.black3,
                ),
                SizedBox(height: 3.h),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: createNeonController.backBoardsNames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 1.h),
                        child: InkWell(
                          onTap: () {
                            createNeonController.selectedBackBoardStyle.value =
                                createNeonController.backBoardsNames[index];
                            createNeonController.isLoading.value = true;
                            createNeonController.isLoading.value = false;
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                border: Border.all(
                                  color: createNeonController
                                              .selectedBackBoardStyle.value ==
                                          createNeonController
                                              .backBoardsNames[index]
                                      ? AppColors.orange
                                      : AppColors.lightGrey,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      createNeonController
                                          .backBoardsNames[index],
                                      style: AppTextStyle.black3,
                                    ),
                                    Text(
                                      createNeonController
                                          .backBoardsSubTitles[index],
                                      style: AppTextStyle.black1
                                          .copyWith(color: AppColors.grey),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    })
              ],
            );
    });
  }
}
