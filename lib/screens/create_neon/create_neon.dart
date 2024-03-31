import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:customneon/controllers/auth_controller.dart';
import 'package:customneon/controllers/create_neon_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/screens/create_neon/create_your_neon_design.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/utills/image_path.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CreateNeon extends StatefulWidget {
  const CreateNeon({Key? key}) : super(key: key);

  @override
  State<CreateNeon> createState() => _CreateNeonState();
}

class _CreateNeonState extends State<CreateNeon> {
  final CreateNeonController createNeonController =
      Get.put(CreateNeonController());
  final AuthController authController = Get.put(AuthController());

  final AppPreferencesController prefs = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      createNeonController.calculateTextSize(
        text: 'Hi',
        style: TextStyle(
          fontFamily: createNeonController.selectedFont.value,
        ),
        context: Get.context!,
      );
    });
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
          return ModalProgressHUD(
            inAsyncCall: createNeonController.isAddingToCart.value,
            progressIndicator: const LoadingIndicator(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///
                    ///
                    ///
                    const HeaderDesign(),

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
                        style: AppTextStyle.white2
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
                        style: AppTextStyle.white2,
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
                                  height: MediaQuery.of(context).size.height,
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
                                    createNeonController.neonText.value,
                                    textAlign: createNeonController
                                                .selectedTextAlign.value ==
                                            "center"
                                        ? TextAlign.center
                                        : createNeonController
                                                    .selectedTextAlign.value ==
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
                                          ? createNeonController.selectedColor
                                          : AppColors.white,
                                      fontFamily: createNeonController
                                          .selectedFont.value,
                                      shadows: !createNeonController
                                              .showNeon.value
                                          ? <Shadow>[]
                                          : <Shadow>[
                                              Shadow(
                                                  offset:
                                                      const Offset(0.0, 0.0),
                                                  blurRadius: 30.0,
                                                  color: createNeonController
                                                      .selectedColor),
                                              Shadow(
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 35.0,
                                                color: createNeonController
                                                    .selectedColor,
                                              ),
                                              Shadow(
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 40.0,
                                                color: createNeonController
                                                    .selectedColor,
                                              ),
                                              Shadow(
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 45.0,
                                                color: createNeonController
                                                    .selectedColor,
                                              ),
                                              Shadow(
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 50.0,
                                                color: createNeonController
                                                    .selectedColor,
                                              ),
                                              Shadow(
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 55.0,
                                                color: createNeonController
                                                    .selectedColor,
                                              ),
                                              Shadow(
                                                offset: const Offset(0.0, 0.0),
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
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: getSizeInfo(createNeonController
                                        .selectedSize.value),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 2.h, right: 2.h),
                                    child: Text(
                                      '\$${createNeonController.totalPrice.value}',
                                      style: AppTextStyle.white2.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                      int newIndex =
                                          createNeonController.showNeon.value
                                              ? 1
                                              : 0;
                                      createNeonController.showNeon.value =
                                          !createNeonController.showNeon.value;

                                      createNeonController.onToggle(newIndex);
                                    },
                                    child: ToggleSwitch(
                                      initialLabelIndex:
                                          createNeonController.showNeon.value
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
                                        createNeonController.onToggle(index);
                                      },
                                    ),
                                  ),
                                ),

                                ///
                                ///
                              ],
                            ),
                          ),

                          ///
                          ///
                          ///
                          ///
                          const CreateYourNeonDesign(),

                          ///
                          ///
                          ///
                          ///
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
                                style: AppTextStyle.white2,
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
                                style: AppTextStyle.white2,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Order today for your item(s) to dispatch by Dec 22.',
                                style: AppTextStyle.white2,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "You'll receive your package between Dec 21 and Jan 05",
                                style: AppTextStyle.white2,
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
                    SizedBox(
                      height: 2.h,
                    ),

                    ///
                    Center(
                      child: SizedBox(
                        width: 90.w,
                        child: BeforeAfter(
                          beforeImage: Image.asset(
                            AppImagePath.afterimage,
                            width: 90.w,
                            fit: BoxFit.contain,
                          ),
                          afterImage: Image.asset(
                            AppImagePath.beforeImage,
                            width: 90.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 6.h,
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
            ),
          );
        },
      ),
    );
  }

  ///
  ///
  ///
  ///
  Widget getSizeInfo(String size) {
    return Obx(() {
      switch (size) {
        case "S":
          return Text(
            "H: ${createNeonController.textHeight.value.toStringAsFixed(2)}cm / ${(createNeonController.textHeight.value / 2.54).toStringAsFixed(2)}in \nW: ${createNeonController.textWidth.value.toStringAsFixed(2)}cm / ${(createNeonController.textWidth.value / 2.54).toStringAsFixed(2)}in",
            style: AppTextStyle.white1,
          );

        case "M":
          double height = createNeonController.textHeight.value + 2.5;
          double width = createNeonController.textWidth.value + 2.5;
          return Text(
            "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in \nW: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
            style: AppTextStyle.white1,
          );

        case "L":
          double height = createNeonController.textHeight.value + 5;
          double width = createNeonController.textWidth.value + 5;
          return Text(
            "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in \nW: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
            style: AppTextStyle.white1,
          );
        case "XL":
          double height = createNeonController.textHeight.value + 7.5;
          double width = createNeonController.textWidth.value + 7.5;
          return Text(
            "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in \nW: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
            style: AppTextStyle.white1,
          );
        case "XXL":
          double height = createNeonController.textHeight.value + 10;
          double width = createNeonController.textWidth.value + 10;
          return Text(
            "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in \nW: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
            style: AppTextStyle.white1,
          );
        case "Custom":
          double height = createNeonController.textHeight.value + 12.5;
          double width = createNeonController.textHeight.value + 12.5;
          return Text(
            "H: ${height.toStringAsFixed(2)}cm / ${(height / 2.54).toStringAsFixed(2)}in \nW: ${width.toStringAsFixed(2)}cm / ${(width / 2.54).toStringAsFixed(2)}in",
            style: AppTextStyle.white1,
          );
        default:
          return Text(
            "H: ${createNeonController.textHeight.value.toStringAsFixed(2)}cm / ${(createNeonController.textHeight.value / 2.54).toStringAsFixed(2)}in \nW: ${createNeonController.textWidth.value.toStringAsFixed(2)}cm / ${(createNeonController.textWidth.value / 2.54).toStringAsFixed(2)}in",
            style: AppTextStyle.white1,
          );
      }
    });
  }

  ///
  ///
  ///

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
            style: AppTextStyle.white2.copyWith(
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
