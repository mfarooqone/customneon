import 'package:customneon/controllers/cart_controller.dart';
import 'package:customneon/models/cart_model.dart';
import 'package:customneon/screens/cart/web_view.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/utills/image_path.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:customneon/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await cartController.getCartData();
    });
    super.initState();
  }

  final TextEditingController promoCodeControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          Get.offAllNamed(HomePage.routeName);
        },
        child: Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: cartController.isLoading.value,
            progressIndicator: const LoadingIndicator(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeaderDesign(),

                    ///
                    if (cartController.cartList.isEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.h),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Shopping Cart",
                                style: AppTextStyle.white4,
                              ),
                              SizedBox(height: 2.h),
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 20.h,
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "Your Cart Is Currently Empty!",
                                style: AppTextStyle.white4,
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "Before procedd to checkout you must add some products to your shopping cart",
                                style: AppTextStyle.white1,
                              ),
                              SizedBox(height: 4.h),
                              PrimaryButton(
                                title: "Create new design",
                                onPressed: () {
                                  Get.offAllNamed(HomePage.routeName);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.h),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartController.cartList.length,
                        itemBuilder: (context, index) {
                          CartModel cart = cartController.cartList[index];
                          Color color = cartController.getColorFromName(
                              colorName: cart.color!);
                          double imageWidth =
                              MediaQuery.of(context).size.width * 0.2;
                          double imageHeight =
                              MediaQuery.of(context).size.width * 0.1;
                          return Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: 3.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.h),
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                        child: Image.asset(
                                          AppImagePath.bgImage,
                                          fit: BoxFit.fill,
                                          width: imageWidth,
                                          height: imageHeight,
                                        ),
                                      ),
                                      SizedBox(
                                        width: imageWidth,
                                        height: imageHeight,
                                        child: Center(
                                          child: Text(
                                            cart.neon!,
                                            textAlign: cart.align == "center"
                                                ? TextAlign.center
                                                : cart.align == "left"
                                                    ? TextAlign.left
                                                    : cart.align == "right"
                                                        ? TextAlign.right
                                                        : TextAlign.center,
                                            style: AppTextStyle.white4.copyWith(
                                              fontSize: 6.sp,
                                              fontWeight: FontWeight.w800,
                                              color: color,
                                              fontFamily: cart.fontstyle,
                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 30.0,
                                                    color: color),
                                                Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 35.0,
                                                    color: color),
                                                Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 40.0,
                                                    color: color),
                                                Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 45.0,
                                                    color: color),
                                                Shadow(
                                                    offset:
                                                        const Offset(0.0, 0.0),
                                                    blurRadius: 50.0,
                                                    color: color),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${cart.neon}",
                                          style: AppTextStyle.white3),
                                      SizedBox(height: 1.h),
                                      rowWidget(
                                          "Font Style:", "${cart.fontstyle}"),
                                      SizedBox(height: 1.h),
                                      rowWidget("Color:", "${cart.color}"),
                                      SizedBox(height: 1.h),
                                      rowWidget("Size:", "${cart.size}"),
                                      SizedBox(height: 1.h),
                                      rowWidget(
                                          "Location:", "${cart.location}"),
                                      SizedBox(height: 1.h),
                                      rowWidget("Adaptor Type:",
                                          "${cart.adaptertype}"),
                                      SizedBox(height: 1.h),
                                      rowWidget("Amount", "\$${cart.price}"),
                                      SizedBox(height: 1.h),
                                      rowWidget("Shipping", "Gratis"),
                                      SizedBox(height: 1.h),
                                      rowWidget("Total", "\$${cart.price}"),
                                      SizedBox(height: 3.h),
                                      const Text("testing"),
                                      SizedBox(height: 3.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: PrimaryButton(
                                              title: "Remove",
                                              backgroundColor: AppColors.red,
                                              onPressed: () {
                                                cartController.deleteCartItem(
                                                    itemId: cart.id!);
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 1.w),
                                          Expanded(
                                            child: PrimaryButton(
                                              title: "Go To Checkout",
                                              onPressed: () async {
                                                await cartController
                                                    .makePayment(
                                                  amount: cart.price!,
                                                )
                                                    .then((value) {
                                                  print(cartController
                                                      .clientSecret.value);
                                                  Get.toNamed(
                                                    PaymentPage.routeName,
                                                  );
                                                });

                                                ///
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    ///
                    ///
                    FooterDesign(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget rowWidget(String label, String text) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyle.white2,
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          text,
          style: AppTextStyle.white2,
        ),
      ],
    );
  }
}
