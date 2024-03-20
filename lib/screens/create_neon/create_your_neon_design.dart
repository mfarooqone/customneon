import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/screens/create_neon/backboard_color.dart';
import 'package:customneon/screens/create_neon/backboard_style_widget.dart';
import 'package:customneon/screens/create_neon/choose_color_widget.dart';
import 'package:customneon/screens/create_neon/choose_size_widget.dart';
import 'package:customneon/screens/create_neon/location.dart';
import 'package:customneon/screens/create_neon/remote_dimmer.dart';
import 'package:customneon/screens/create_neon/select_font.dart';
import 'package:customneon/screens/create_neon/text_align_widget.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/widgets/adapter_dropdown.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CreateYourNeonDesign extends StatefulWidget {
  const CreateYourNeonDesign({Key? key}) : super(key: key);
  @override
  State<CreateYourNeonDesign> createState() => _CreateYourNeonDesignState();
}

class _CreateYourNeonDesignState extends State<CreateYourNeonDesign> {
  ///
  ///
  final CreateNeonController createNeonController =
      Get.put(CreateNeonController());

  ///
  ///
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  ///
  ///
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.28,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Create Your Neon Sign',
                  style: AppTextStyle.white4,
                ),
              ),
              SizedBox(height: 3.h),

              ///
              ///
              ///
              PrimaryTextField(
                heading: "Write your text",
                controller: textEditingController,
                hintText: "Hi",
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    createNeonController.neonText.value = value;

                    ///
                    createNeonController.calculateTextSize(
                      text: createNeonController.neonText.value,
                      style: TextStyle(
                        fontFamily: createNeonController.selectedFont.value,
                      ),
                      context: context,
                    );

                    print(
                        'height ${createNeonController.textHeight} and width ${createNeonController.textWidth}');
                  });
                },
              ),

              ///
              if (textEditingController.text.length <= 1)
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.orange,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                    child: Text(
                      '2 or more characters are required for this size, please add more characters.',
                      style: AppTextStyle.white2,
                    ),
                  ),
                ),

              ///
              ///
              ///
              SizedBox(height: 3.h),

              const SelectFont(),

              SizedBox(height: 3.h),

              const TextAlignWidget(),

              SizedBox(height: 3.h),

              ///
              ///
              ///
              const ChooseColorWidget(),

              ///
              ///
              ///
              SizedBox(height: 3.h),

              ///
              ///
              ///
              const ChooseSizeWidget(),

              ///
              ///
              ///
              SizedBox(height: 3.h),

              ///
              ///
              ///
              const BackboardStyleWidget(),

              ///
              ///
              ///
              SizedBox(height: 3.h),

              ///
              ///
              ///
              const BackboardColorWidget(),

              SizedBox(height: 3.h),

              ///
              ///
              ///

              const LocationWidget(),

              ///
              SizedBox(height: 3.h),

              ///
              ///
              Text(
                'Power Adapter',
                style: AppTextStyle.white3,
              ),
              const AdapterDropDown(),

              ///
              ///
              ///
              ///

              SizedBox(height: 3.h),

              ///
              const RemoteDimmerWidget(),

              SizedBox(height: 3.h),

              ///
              ///
              ///
              Text(
                'Additional Requirements',
                style: AppTextStyle.white3,
              ),
              Text(
                'Specify further requirements on your custom neon.',
                style: AppTextStyle.white1.copyWith(color: AppColors.grey),
              ),
              Text(
                'Specify further requirements on your custom neon.',
                style: AppTextStyle.white1.copyWith(color: AppColors.grey),
              ),

              ///
              ///
              ///

              SizedBox(height: 1.h),

              ///
              ///
              ///
              PrimaryTextField(
                controller: textEditingController,
                maxLines: null,
                onChanged: (value) {
                  setState(() {});
                },
              ),

              SizedBox(height: 3.h),
              Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.lightGrey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///
                      ///
                      const SizedBox(
                        height: 1,
                      ),

                      ///
                      ///
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$${createNeonController.totalAmount.value}',
                            style: AppTextStyle.white3.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '  Tax and expedited shipping included',
                            style: AppTextStyle.white1,
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      if (textEditingController.text.length <= 1)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: Text(
                            '2 or more characters are required for this size, please add more characters.',
                            style: AppTextStyle.white1
                                .copyWith(color: AppColors.red),
                          ),
                        ),
                      SizedBox(height: 1.h),

                      ///
                      ///
                      ///
                      Container(
                        height: 8.h,
                        width: MediaQuery.of(context).size.width,
                        color: AppColors.orange,
                        child: Center(
                          child: Text(
                            'Finalize and Review',
                            style: AppTextStyle.white4,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )

              ///
              ///
              ///
            ],
          ),
        ),
      ),
    );
  }
}
