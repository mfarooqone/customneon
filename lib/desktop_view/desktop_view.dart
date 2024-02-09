// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:customneon/controllers/create_neon_controller.dart';
// import 'package:customneon/utills/app_colors.dart';
// import 'package:customneon/utills/app_text_style.dart';
// import 'package:customneon/utills/image_path.dart';
// import 'package:customneon/widgets/adapter_dropdown.dart';
// import 'package:customneon/widgets/primary_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// class DesktopView extends StatefulWidget {
//   const DesktopView({Key? key}) : super(key: key);

//   @override
//   State<DesktopView> createState() => _DesktopViewState();
// }

// class _DesktopViewState extends State<DesktopView> {
//   final TextEditingController textEditingController = TextEditingController();
//   final CreateNeonController createNeonController =
//       Get.put(CreateNeonController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColors.orange,
//         title: AutoSizeText(
//           'FAST FREE SHIPPING & 1 YEAR WARRANTY',
//           maxLines: 1,
//           style: AppTextStyle.white2,
//         ),
//       ),
//       body: Obx(
//         () {
//           return createNeonController.isLoading.value
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : SingleChildScrollView(
//                   child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 6.h),

//                           ///
//                           ///
//                           ///
//                           Align(
//                             alignment: Alignment.center,
//                             child: AutoSizeText(
//                               'CREATE YOUR OWN NEON SIGN',
//                               maxLines: 1,
//                               style: AppTextStyle.white4
//                                   .copyWith(color: AppColors.orange),
//                             ),
//                           ),

//                           ///
//                           ///
//                           ///
//                           Align(
//                             alignment: Alignment.center,
//                             child: AutoSizeText(
//                               'Design your neon sign with our online custom tool',
//                               maxLines: 1,
//                               style: AppTextStyle.black4,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 6.h,
//                           ),

//                           ///
//                           ///
//                           ///
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             height: 80.h,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     color: AppColors.black,
//                                     width: MediaQuery.of(context).size.width,
//                                     height: MediaQuery.of(context).size.height,
//                                     child: Image.asset(
//                                       AppImagePath.bgImage,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 SingleChildScrollView(
//                                   child: SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.28,
//                                     child: Padding(
//                                       padding:
//                                           EdgeInsets.symmetric(horizontal: 1.w),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           SizedBox(height: 3.h),
//                                           Align(
//                                             alignment: Alignment.topLeft,
//                                             child: AutoSizeText(
//                                               'Create Your Neon Sign',
//                                               style: AppTextStyle.black4,
//                                             ),
//                                           ),
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           PrimaryTextField(
//                                             heading: "Write your text",
//                                             controller: textEditingController,
//                                             maxLines: null,
//                                             onChanged: (value) {
//                                               setState(() {});
//                                             },
//                                           ),

//                                           ///
//                                           if (textEditingController
//                                                   .text.length <=
//                                               1)
//                                             Container(
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               color: AppColors.orange,
//                                               child: Padding(
//                                                 padding: EdgeInsets.symmetric(
//                                                     horizontal: 1.h,
//                                                     vertical: 1.h),
//                                                 child: AutoSizeText(
//                                                   '2 or more characters are required for this size, please add more characters.',
//                                                   style: AppTextStyle.white2,
//                                                 ),
//                                               ),
//                                             ),

//                                           ///
//                                           ///
//                                           ///
//                                           SizedBox(height: 3.h),
//                                           AutoSizeText(
//                                             'Choose a font',
//                                             maxLines: 1,
//                                             style: AppTextStyle.black3,
//                                           ),

//                                           ///
//                                           ///
//                                           ///
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           selectFontWidget(),

//                                           ///
//                                           ///
//                                           ///
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           if (createNeonController
//                                               .showFonts.value)
//                                             fontsView(),

//                                           ///
//                                           ///
//                                           ///

//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           AutoSizeText(
//                                             'Text Align',
//                                             maxLines: 1,
//                                             style: AppTextStyle.black3,
//                                           ),

//                                           ///
//                                           ///
//                                           ///

//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           textAlignWidget(),

//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           AutoSizeText(
//                                             'Choose a colour',
//                                             style: AppTextStyle.black3,
//                                           ),
//                                           AutoSizeText(
//                                             'Minimum height required for Magic LED Neon Sign: 7cm. If color options for Magic LED Neon Sign are unavailable, please choose a larger sign size.',
//                                             style: AppTextStyle.black1.copyWith(
//                                                 color: AppColors.grey),
//                                           ),

//                                           AutoSizeText(
//                                             createNeonController.getColorName(
//                                                 selectedColor:
//                                                     createNeonController
//                                                         .selectedColor),
//                                             style: AppTextStyle.black3,
//                                           ),

//                                           colorsView(),

//                                           ///
//                                           ///
//                                           ///
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           AutoSizeText(
//                                             'Choose a size',
//                                             style: AppTextStyle.black3,
//                                           ),
//                                           AutoSizeText(
//                                             '*Each sign is handcrafted, and sizes shown will be accurate within 1 or 2 inches. Neon sign larger than 43 inches will be made on two or more backboards that can be easily arranged together.',
//                                             style: AppTextStyle.black1.copyWith(
//                                                 color: AppColors.grey),
//                                           ),
//                                           sizeView(),

//                                           ///
//                                           ///
//                                           ///
//                                           SizedBox(height: 3.h),
//                                           AutoSizeText(
//                                             'Backboard Style',
//                                             style: AppTextStyle.black3,
//                                           ),
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           backBoardStyleView(),

//                                           ///
//                                           ///
//                                           ///
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           AutoSizeText(
//                                             'Choose a backboard color',
//                                             style: AppTextStyle.black3,
//                                           ),
//                                           SizedBox(height: 1.h),
//                                           AutoSizeText(
//                                             createNeonController
//                                                 .getBackBoardColorName(
//                                                     selectedColor:
//                                                         createNeonController
//                                                             .selectedBackBoardColor),
//                                             style: AppTextStyle.black3,
//                                           ),
//                                           SizedBox(height: 1.h),
//                                           backBoardColorsView(),

//                                           SizedBox(height: 3.h),
//                                           AutoSizeText(
//                                             'Location',
//                                             style: AppTextStyle.black3,
//                                           ),
//                                           locationView(),

//                                           ///
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           ///
//                                           ///
//                                           const AdapterDropDown(),

//                                           ///
//                                           ///
//                                           ///
//                                           ///

//                                           SizedBox(height: 3.h),
//                                           AutoSizeText(
//                                             'Free Remote and Dimmer',
//                                             style: AppTextStyle.black3,
//                                           ),

//                                           AutoSizeText(
//                                             'A remote and dimmer is included free with every sign! (Except for Multicolor Neon Signs, which are controlled by the APP)',
//                                             style: AppTextStyle.black2.copyWith(
//                                                 color: AppColors.grey),
//                                           ),
//                                           SizedBox(height: 3.h),

//                                           ///
//                                           remoteAndDimmer(),

//                                           ///
//                                           ///
//                                           ///
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 13.h),

//                           ///
//                           ///
//                           ///
//                         ],
//                       )),
//                 );
//         },
//       ),
//     );
//   }

//   Row remoteAndDimmer() {
//     return Row(
//       children: [
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               createNeonController.isRemoteDimmer.value = true;

//               createNeonController.isLoading.value = true;
//               createNeonController.isLoading.value = false;
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(0.5.h),
//                 border: Border.all(
//                   color: createNeonController.isRemoteDimmer.value
//                       ? AppColors.orange
//                       : Colors.grey,
//                   width: 0.1.h,
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 2.h),
//                 child: AutoSizeText(
//                   "Yes",
//                   style: AppTextStyle.black3,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ),

//         ///
//         SizedBox(
//           width: 1.w,
//         ),

//         ///
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               createNeonController.isRemoteDimmer.value = false;

//               createNeonController.isLoading.value = true;
//               createNeonController.isLoading.value = false;
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(0.5.h),
//                 border: Border.all(
//                   color: !createNeonController.isRemoteDimmer.value
//                       ? AppColors.orange
//                       : Colors.grey,
//                   width: 0.1.h,
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 2.h),
//                 child: AutoSizeText(
//                   "No",
//                   style: AppTextStyle.black3,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }



//   Row locationView() {
//     return Row(
//       children: [
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               createNeonController.isOutdoor.value = true;
//               createNeonController.isLoading.value = true;
//               createNeonController.isLoading.value = false;
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(0.5.h),
//                 border: Border.all(
//                   color: createNeonController.isOutdoor.value
//                       ? AppColors.orange
//                       : Colors.grey,
//                   width: 0.1.h,
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 2.h),
//                 child: AutoSizeText(
//                   "Outdoor",
//                   style: AppTextStyle.black3,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         ),

//         ///
//         SizedBox(
//           width: 1.w,
//         ),

//         ///
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               createNeonController.isOutdoor.value = false;
//               createNeonController.isLoading.value = true;
//               createNeonController.isLoading.value = false;
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(0.5.h),
//                 border: Border.all(
//                   color: !createNeonController.isOutdoor.value
//                       ? AppColors.orange
//                       : Colors.grey,
//                   width: 0.1.h,
//                 ),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 2.h),
//                 child: AutoSizeText(
//                   "Indoor",
//                   style: AppTextStyle.black3,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Widget selectFontWidget() {
//     return InkWell(
//       onTap: () {
//         createNeonController.showFonts.value =
//             !createNeonController.showFonts.value;
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(1.h),
//           border: Border.all(
//             color: AppColors.lightGrey,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: AutoSizeText(
//                   createNeonController.selectedFont.value,
//                   style: AppTextStyle.black3,
//                 ),
//               ),
//               SizedBox(width: 1.w),
//               Padding(
//                 padding: EdgeInsets.only(bottom: 1.h),
//                 child: RotatedBox(
//                   quarterTurns: 7,
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 2.h,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   GridView fontsView() {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 1.0.h,
//         mainAxisSpacing: 1.0.h,
//       ),
//       itemCount: 6,
//       itemBuilder: (BuildContext ctx, index) {
//         return Container(
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(1.h),
//               border: Border.all(
//                 color: AppColors.grey,
//               )),
//           child: Text(
//             index.toString(),
//           ),
//         );
//       },
//     );
//   }

//   ///
//   ///
//   ///
//   GridView colorsView() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 1.0.h,
//         mainAxisSpacing: 1.0.h,
//       ),
//       itemCount: createNeonController.neonColorList.length,
//       itemBuilder: (BuildContext ctx, index) {
//         return InkWell(
//           onTap: () {
//             createNeonController.selectedColor =
//                 createNeonController.neonColorList[index];
//             createNeonController.isLoading.value = true;
//             createNeonController.isLoading.value = false;
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(0.5.h),
//               border: Border.all(
//                 color: createNeonController.neonColorList[index] ==
//                         createNeonController.selectedColor
//                     ? AppColors.orange
//                     : Colors.transparent,
//                 width: 0.1.h,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(1.h),
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: createNeonController.neonColorList[index],
//                   borderRadius: BorderRadius.circular(1.h),
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 0.1.h,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   ///
//   ///
//   ///
//   ListView backBoardStyleView() {
//     return ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: createNeonController.backBoardsNames.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(bottom: 1.h),
//             child: InkWell(
//               onTap: () {
//                 createNeonController.selectedBackBoardStyle.value =
//                     createNeonController.backBoardsNames[index];
//                 createNeonController.isLoading.value = true;
//                 createNeonController.isLoading.value = false;
//               },
//               child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(1.h),
//                     border: Border.all(
//                       color:
//                           createNeonController.selectedBackBoardStyle.value ==
//                                   createNeonController.backBoardsNames[index]
//                               ? AppColors.orange
//                               : AppColors.lightGrey,
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(2.h),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AutoSizeText(
//                           createNeonController.backBoardsNames[index],
//                           style: AppTextStyle.black3,
//                         ),
//                         AutoSizeText(
//                           createNeonController.backBoardsSubTitles[index],
//                           style: AppTextStyle.black1
//                               .copyWith(color: AppColors.grey),
//                         ),
//                       ],
//                     ),
//                   )),
//             ),
//           );
//         });
//   }

//   ///
//   ///
//   ///
//   GridView backBoardColorsView() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 1.0.h,
//         mainAxisSpacing: 1.0.h,
//       ),
//       itemCount: createNeonController.backBoardColorList.length,
//       itemBuilder: (BuildContext ctx, index) {
//         return InkWell(
//           onTap: () {
//             createNeonController.selectedBackBoardColor =
//                 createNeonController.backBoardColorList[index];
//             createNeonController.isLoading.value = true;
//             createNeonController.isLoading.value = false;
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(0.5.h),
//               border: Border.all(
//                 color: createNeonController.backBoardColorList[index] ==
//                         createNeonController.selectedBackBoardColor
//                     ? AppColors.orange
//                     : Colors.transparent,
//                 width: 0.1.h,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(1.h),
//               child: Container(
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: createNeonController.backBoardColorList[index],
//                   borderRadius: BorderRadius.circular(1.h),
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 0.1.h,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   ///
//   ///
//   ///
//   GridView sizeView() {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: EdgeInsets.zero,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 1.0.h,
//         mainAxisSpacing: 1.0.h,
//       ),
//       itemCount: createNeonController.sizeNames.length,
//       itemBuilder: (BuildContext ctx, index) {
//         return InkWell(
//           onTap: () {
//             createNeonController.selectedSize.value =
//                 createNeonController.sizeNames[index];
//             createNeonController.isLoading.value = true;
//             createNeonController.isLoading.value = false;
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(0.5.h),
//               border: Border.all(
//                 color: createNeonController.sizeNames[index] ==
//                         createNeonController.selectedSize.value
//                     ? AppColors.orange
//                     : Colors.transparent,
//                 width: 0.1.h,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(1.h),
//               child: Container(
//                 alignment: Alignment.center,
//                 child: Text(createNeonController.sizeNames[index]),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   ///
//   ///
//   ///

//   Widget textAlignWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(
//           onTap: () {
//             createNeonController.selectedTextAlign.value = "left";
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 1.h,
//               ),
//               border: Border.all(
//                 color: createNeonController.selectedTextAlign.value == "left"
//                     ? AppColors.orange
//                     : AppColors.lightGrey,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(1.h),
//               child: Icon(
//                 Icons.format_align_left,
//                 size: 2.w,
//               ),
//             ),
//           ),
//         ),

//         ///
//         ///
//         ///
//         InkWell(
//           onTap: () {
//             createNeonController.selectedTextAlign.value = "center";
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 1.h,
//               ),
//               border: Border.all(
//                 color: createNeonController.selectedTextAlign.value == "center"
//                     ? AppColors.orange
//                     : AppColors.lightGrey,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(1.h),
//               child: Icon(
//                 Icons.format_align_center,
//                 size: 2.w,
//               ),
//             ),
//           ),
//         ),

//         ///
//         ///
//         ///
//         InkWell(
//           onTap: () {
//             createNeonController.selectedTextAlign.value = "right";
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 1.h,
//               ),
//               border: Border.all(
//                 color: createNeonController.selectedTextAlign.value == "right"
//                     ? AppColors.orange
//                     : AppColors.lightGrey,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(1.h),
//               child: Icon(
//                 Icons.format_align_right,
//                 size: 2.w,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
