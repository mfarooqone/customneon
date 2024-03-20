import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/screens/create_neon/backboard_style_widget.dart';
import 'package:customneon/screens/create_neon/choose_color_widget.dart';
import 'package:customneon/screens/create_neon/choose_size_widget.dart';
import 'package:customneon/screens/create_neon/location.dart';
import 'package:customneon/screens/create_neon/select_font.dart';
import 'package:customneon/screens/create_neon/text_align_widget.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/utills/image_path.dart';
import 'package:customneon/widgets/adapter_dropdown.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:customneon/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'backboard_color.dart';
import 'remote_dimmer.dart';

class CreateNeon extends StatefulWidget {
  const CreateNeon({Key? key}) : super(key: key);

  @override
  State<CreateNeon> createState() => _CreateNeonState();
}

class _CreateNeonState extends State<CreateNeon> {
  final TextEditingController textEditingController = TextEditingController();
  final CreateNeonController createNeonController =
      Get.put(CreateNeonController());

  final AppPreferencesController prefs = Get.find();

  ///

  GlobalKey txtKey = GlobalKey();
  Size size = Size.zero;
  @override
  void initState() {
    textEditingController.text = 'Hi';
    super.initState();
  }

  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.orange,
        title: Text(
          'FAST FREE SHIPPING & 1 YEAR WARRANTY',
          maxLines: 1,
          style: AppTextStyle.white2,
        ),
      ),
      body: Obx(
        () {
          return createNeonController.isLoading.value
              ? const LoadingIndicator()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///
                        ///
                        ///
                        HeaderDesign(),

                        ///
                        ///
                        ///
                        SizedBox(height: 1.h),

                        ///
                        ///
                        ///
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'CREATE YOUR OWN NEON SIGN',
                            maxLines: 1,
                            style: AppTextStyle.white3
                                .copyWith(color: AppColors.orange),
                          ),
                        ),

                        ///
                        ///
                        ///
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Design your neon sign with our online custom tool',
                            maxLines: 1,
                            style: AppTextStyle.white3,
                          ),
                        ),
                        SizedBox(height: 6.h),

                        ///
                        ///
                        ///
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 80.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      color: AppColors.black,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Image.asset(
                                        AppImagePath.bgImage,
                                        fit: BoxFit.cover,
                                        color: AppColors.black.withOpacity(0.2),
                                        colorBlendMode: BlendMode.darken,
                                      ),
                                    ),

                                    ///
                                    ///
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        textEditingController.text,
                                        key: txtKey,
                                        textAlign: createNeonController
                                                    .selectedTextAlign.value ==
                                                "center"
                                            ? TextAlign.center
                                            : createNeonController
                                                        .selectedTextAlign
                                                        .value ==
                                                    "left"
                                                ? TextAlign.left
                                                : createNeonController
                                                            .selectedTextAlign
                                                            .value ==
                                                        "right"
                                                    ? TextAlign.right
                                                    : TextAlign.center,
                                        style: AppTextStyle.white4.copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800,
                                          color: !createNeonController
                                                  .showNeon.value
                                              ? createNeonController
                                                  .selectedColor
                                              : AppColors.white,
                                          fontFamily: createNeonController
                                              .selectedFont.value,
                                          shadows: !createNeonController
                                                  .showNeon.value
                                              ? <Shadow>[]
                                              : <Shadow>[
                                                  Shadow(
                                                      offset: const Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 30.0,
                                                      color:
                                                          createNeonController
                                                              .selectedColor),
                                                  Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 35.0,
                                                    color: createNeonController
                                                        .selectedColor,
                                                  ),
                                                  Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 40.0,
                                                    color: createNeonController
                                                        .selectedColor,
                                                  ),
                                                  Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 45.0,
                                                    color: createNeonController
                                                        .selectedColor,
                                                  ),
                                                  Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 50.0,
                                                    color: createNeonController
                                                        .selectedColor,
                                                  ),
                                                  Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 55.0,
                                                    color: createNeonController
                                                        .selectedColor,
                                                  ),
                                                  Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 60.0,
                                                    color: createNeonController
                                                        .selectedColor,
                                                  ),
                                                ],
                                        ),
                                      ),
                                    ),

                                    ///
                                    ///
                                    ///

                                    Padding(
                                      padding: EdgeInsets.all(2.h),
                                      child: GestureDetector(
                                        onTap: () {
                                          int newIndex = createNeonController
                                                  .showNeon.value
                                              ? 1
                                              : 0;
                                          createNeonController.showNeon.value =
                                              !createNeonController
                                                  .showNeon.value;

                                          createNeonController
                                              .onToggle(newIndex);
                                        },
                                        child: ToggleSwitch(
                                          initialLabelIndex:
                                              createNeonController
                                                      .showNeon.value
                                                  ? 0
                                                  : 1,
                                          totalSwitches: 2,
                                          labels: const [
                                            'On',
                                            'Off',
                                          ],
                                          borderColor: [AppColors.grey],
                                          activeBgColor: [AppColors.orange],
                                          inactiveBgColor: AppColors.grey,
                                          onToggle: (index) {
                                            createNeonController
                                                .onToggle(index);
                                          },
                                        ),
                                      ),
                                    ),

                                    ///
                                    ///
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          maxLines: null,
                                          onChanged: (value) {
                                            setState(() {
                                              createNeonController
                                                  .neonText.value = value;

                                              ///
                                              createNeonController
                                                  .calculateTextSize(
                                                text: createNeonController
                                                    .neonText.value,
                                                style: TextStyle(
                                                  fontFamily:
                                                      createNeonController
                                                          .selectedFont.value,
                                                ),
                                                context: context,
                                              );

                                              print(
                                                  'height ${createNeonController.textHeight} and width ${createNeonController.textWidth}');
                                            });
                                          },
                                        ),

                                        ///
                                        if (textEditingController.text.length <=
                                            1)
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AppColors.orange,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.h,
                                                  vertical: 1.h),
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
                                          style: AppTextStyle.white1
                                              .copyWith(color: AppColors.grey),
                                        ),
                                        Text(
                                          'Specify further requirements on your custom neon.',
                                          style: AppTextStyle.white1
                                              .copyWith(color: AppColors.grey),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: AppColors.lightGrey,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ///
                                                ///
                                                const SizedBox(
                                                  height: 1,
                                                ),

                                                ///
                                                ///
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '\$${createNeonController.totalAmount.value}',
                                                      style: AppTextStyle.white3
                                                          .copyWith(
                                                              color:
                                                                  Colors.green,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    Text(
                                                      '  Tax and expedited shipping included',
                                                      style:
                                                          AppTextStyle.white1,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 1.h),
                                                if (textEditingController
                                                        .text.length <=
                                                    1)
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w),
                                                    child: Text(
                                                      '2 or more characters are required for this size, please add more characters.',
                                                      style: AppTextStyle.white1
                                                          .copyWith(
                                                              color: AppColors
                                                                  .red),
                                                    ),
                                                  ),
                                                SizedBox(height: 1.h),

                                                ///
                                                ///
                                                ///
                                                Container(
                                                  height: 8.h,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: AppColors.orange,
                                                  child: Center(
                                                    child: Text(
                                                      'Finalize and Review',
                                                      style:
                                                          AppTextStyle.white4,
                                                      textAlign:
                                                          TextAlign.center,
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
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),

                        ///
                        ///
                        ///
                        Center(
                          child: Container(
                            height: 10.h,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                                color: Colors.green[35],
                                border: Border.all(
                                  color: Colors.green,
                                )),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.h, vertical: 1.h),
                                  child: Image.asset(
                                    AppImagePath.carbonNeutral,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: Text(
                                    'Carbon neutral shipping on all orders',
                                    style: AppTextStyle.white3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///
                        ///
                        ///
                        SizedBox(height: 2.h),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.h, vertical: 2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expedited Free Shipping',
                                    style: AppTextStyle.white3,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'Order today for your item(s) to dispatch by Dec 22.',
                                    style: AppTextStyle.white3,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "You'll receive your package between Dec 21 and Jan 05",
                                    style: AppTextStyle.white3,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        ///
                        ///
                        ///
                        SizedBox(height: 4.h),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'WHY CUSTOMNEON',
                            style: AppTextStyle.white4.copyWith(
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 8.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///
                            ///
                            ///
                            detailsStyle(
                              image: AppImagePath.fastAndFreeDelivery,
                              title: 'FAST & FREE DELIVERY',
                              subTitle:
                                  'For all orders, we offer free worldwide shipping. Standard orders typically take 9-11 business days, which includes both production and shipping to most addresses around the world.',
                            ),

                            ///
                            detailsStyle(
                              image: AppImagePath.twoYearGuarntee,
                              title: '2-YEAR GUARANTEE',
                              subTitle:
                                  'Our signs feature high-quality LED neon technology and come with a 2-year warranty for durability assurance, providing you with peace of mind regarding their durability.',
                            ),

                            ///
                            detailsStyle(
                              image: AppImagePath.highEfficiency,
                              title: 'HIGH EFFICIENCY',
                              subTitle:
                                  'Our LED neon signs are eco-friendly and energy-efficient, providing high brightness while consuming 80% less power than traditional options. They have a sustainable lifespan of over 100,000 hours.',
                            ),
                          ],
                        ),

                        ///
                        ///
                        ///
                        SizedBox(height: 8.h),

                        ///
                        ///
                        ///
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///
                            detailsStyle(
                              image: AppImagePath.professionalService,
                              title: 'PROFESSIONAL SERVICE',
                              subTitle:
                                  'Our team of customer service experts is here to assist you. Contact us via phone or email, and within 2 business days, we’ll provide you with a personalized solution.',
                            ),

                            ///
                            detailsStyle(
                              image: AppImagePath.fullyCustomizable,
                              title: 'FULLY COSTUMIZABLE',
                              subTitle:
                                  'Each element of your neon sign can be fully customized to your liking. We have the capability to create any neon sign you desire, offering a variety of fonts, backboards and an extensive range of colors.',
                            ),

                            ///
                            ///
                            detailsStyle(
                              image: AppImagePath.easyInstallation,
                              title: 'EASY INSTALLATION',
                              subTitle:
                                  'Depending on the installation requirements of each product, relevant installation accessories will be included in the package free of charge to assist you in easily installing your neon sign.',
                            ),

                            ///
                          ],
                        ),

                        SizedBox(height: 8.h),

                        ///
                        ///
                        ///
                        Center(
                          child: Image.asset(
                            AppImagePath.neonFlow,
                            width: 90.w,
                            fit: BoxFit.contain,
                          ),
                        ),

                        ///
                        ///
                        ///

                        BeforeAfter(
                          beforeImage: Image.asset(AppImagePath.afterimage),
                          afterImage: Image.asset(AppImagePath.beforeImage),
                        ),

                        ///
                        ///
                        ///
                        ///
                        FooterDesign(),

                        ///
                        ///
                        ///
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }

  SizedBox detailsStyle({
    required String image,
    required String title,
    required String subTitle,
  }) {
    return SizedBox(
      width: 20.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            height: 10.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 3.h),

          ///
          Text(
            title,
            style: AppTextStyle.white3.copyWith(
              color: AppColors.orange,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),

          ///
          SizedBox(height: 1.h),

          ///
          Text(
            subTitle,
            style: AppTextStyle.white2,
            textAlign: TextAlign.center,
          ),

          ///
        ],
      ),
    );
  }
}
