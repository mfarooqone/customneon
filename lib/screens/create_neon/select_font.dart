import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SelectFont extends StatefulWidget {
  const SelectFont({super.key});

  @override
  State<SelectFont> createState() => _SelectFontState();
}

class _SelectFontState extends State<SelectFont> {
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
            'Choose a font',
            maxLines: 1,
            style: AppTextStyle.white3,
          ),
          SizedBox(height: 1.h),
          InkWell(
            onTap: () {
              createNeonController.showFonts.value =
                  !createNeonController.showFonts.value;
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h),
                border: Border.all(
                  color: AppColors.lightGrey,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        createNeonController.selectedFont.value,
                        style: AppTextStyle.white3,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.h),
                      child: RotatedBox(
                        quarterTurns: 7,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 2.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (createNeonController.showFonts.value) SizedBox(height: 3.h),
          if (createNeonController.showFonts.value)
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 1.0.h,
                mainAxisSpacing: 1.0.h,
              ),
              itemCount: createNeonController.fontNames.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () {
                    createNeonController.isLoading.value = true;
                    createNeonController.selectedFont.value =
                        createNeonController.fontNames[index];
                    createNeonController.isLoading.value = false;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h),
                        border: Border.all(
                          color: createNeonController.selectedFont.value ==
                                  createNeonController.fontNames[index]
                              ? AppColors.orange
                              : AppColors.grey,
                        )),
                    child: Text(
                      createNeonController.fontNames[index],
                      style: AppTextStyle.white4.copyWith(
                        fontFamily: createNeonController.fontNames[index],
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
