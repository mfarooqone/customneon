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
    final Map<String, Widget> sizeInfoWidgets = {
      "S": getSizeInfoWidget("S"),
      "M": getSizeInfoWidget("M"),
      "L": getSizeInfoWidget("L"),
      "XL": getSizeInfoWidget("XL"),
      "XXL": getSizeInfoWidget("XXL"),
      "Custom": getSizeInfoWidget("Custom"),
    };
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

                        createNeonController.calculateTextSize(
                          text: createNeonController.neonText.value,
                          style: TextStyle(
                            fontFamily: createNeonController.selectedFont.value,
                          ),
                          context: context,
                        );
                        createNeonController.isLoading.value = true;
                        createNeonController.isLoading.value = false;
                      },
                      child: Container(
                        height: 10.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.5.h),
                          border: Border.all(
                            color: e == createNeonController.selectedSize.value
                                ? AppColors.orange
                                : Colors.grey,
                            width: 0.1.h,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  e,
                                  style: AppTextStyle.white2,
                                ),
                                const Spacer(),
                                sizeInfoWidgets[e]!,
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            );
    });
  }

  Widget getSizeInfoWidget(String size) {
    return Obx(() {
      switch (size) {
        case "S":
          return Column(
            children: [
              Text(
                "H: ${createNeonController.textHeight.value.toStringAsFixed(2)}cm / ${(createNeonController.textHeight.value / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
              Text(
                "W: ${createNeonController.textWidth.value.toStringAsFixed(2)}cm / ${(createNeonController.textWidth.value / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
            ],
          );
        case "M":
          double height = createNeonController.textHeight.value + 5;
          double width = createNeonController.textWidth.value + 10;
          return Column(
            children: [
              Text(
                "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
              Text(
                "W: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
            ],
          );
        case "L":
          double height = createNeonController.textHeight.value + 10;
          double width = createNeonController.textWidth.value + 20;
          return Column(
            children: [
              Text(
                "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
              Text(
                "W: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
            ],
          );
        case "XL":
          double height = createNeonController.textHeight.value + 15;
          double width = createNeonController.textWidth.value + 30;
          return Column(
            children: [
              Text(
                "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
              Text(
                "W: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
            ],
          );
        case "XXL":
          double height = createNeonController.textHeight.value + 20;
          double width = createNeonController.textWidth.value + 40;
          return Column(
            children: [
              Text(
                "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
              Text(
                "W: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
            ],
          );
        case "Custom":
          double height = createNeonController.textHeight.value + 25;
          double width = createNeonController.textHeight.value + 50;
          return Column(
            children: [
              Text(
                "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
              Text(
                "W: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
            ],
          );
        default:
          return Column(
            children: [
              Text(
                "H: ${createNeonController.textHeight.value.toStringAsFixed(2)}cm / ${(createNeonController.textHeight.value / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
              Text(
                "W: ${createNeonController.textWidth.value.toStringAsFixed(2)}cm / ${(createNeonController.textWidth.value / 2.54).toStringAsFixed(2)}in",
                style: AppTextStyle.white1,
              ),
            ],
          );
      }
    });
  }
}
