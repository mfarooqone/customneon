import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RemoteDimmerWidget extends StatefulWidget {
  const RemoteDimmerWidget({super.key});

  @override
  State<RemoteDimmerWidget> createState() => _RemoteDimmerWidgetState();
}

class _RemoteDimmerWidgetState extends State<RemoteDimmerWidget> {
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
                  'Free Remote and Dimmer',
                  style: AppTextStyle.black3,
                ),

                Text(
                  'A remote and dimmer is included free with every sign! (Except for Multicolor Neon Signs, which are controlled by the APP)',
                  style: AppTextStyle.black2.copyWith(color: AppColors.grey),
                ),
                SizedBox(height: 3.h),

                ///
                ///
                ///
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          createNeonController.isRemoteDimmer.value = true;

                          createNeonController.isLoading.value = true;
                          createNeonController.isLoading.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5.h),
                            border: Border.all(
                              color: createNeonController.isRemoteDimmer.value
                                  ? AppColors.orange
                                  : Colors.grey,
                              width: 0.1.h,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text(
                              "Yes",
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
                          createNeonController.isRemoteDimmer.value = false;

                          createNeonController.isLoading.value = true;
                          createNeonController.isLoading.value = false;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.5.h),
                            border: Border.all(
                              color: !createNeonController.isRemoteDimmer.value
                                  ? AppColors.orange
                                  : Colors.grey,
                              width: 0.1.h,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text(
                              "No",
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
