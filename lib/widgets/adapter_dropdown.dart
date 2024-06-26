import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AdapterDropDown extends StatefulWidget {
  const AdapterDropDown({Key? key}) : super(key: key);
  @override
  State<AdapterDropDown> createState() => _AdapterDropDownState();
}

class _AdapterDropDownState extends State<AdapterDropDown> {
  final CreateNeonController createNeonController =
      Get.put(CreateNeonController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(1.0.h),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: AppTextStyle.white2,
          ),
          items: createNeonController.adapterList
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppTextStyle.white2,
                    ),
                  ))
              .toList(),
          value: createNeonController.selectedAdapter.value,
          onChanged: (String? value) {
            setState(() {
              createNeonController.selectedAdapter.value = value!;
            });
          },
        ),
      ),
    );
  }
}
