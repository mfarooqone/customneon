import 'package:customneon/controllers/cart_controller.dart';
import 'package:customneon/models/cart_model.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:customneon/utills/app_text_style.dart';
import 'package:customneon/utills/image_path.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return cartController.isLoading.value
          ? const LoadingIndicator()
          : Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("data"), // if (storedUser!.cart != null)
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cartController.cartList.length,
                      itemBuilder: (context, index) {
                        CartModel cart = cartController.cartList[index];
                        Color color = cartController.getColorFromName(
                          colorName: cart.color!,
                        );

                        return Row(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: Image.asset(
                                    AppImagePath.bgImage,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 20.w,
                                    height: 20.h,
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
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 30.0,
                                              color: color),
                                          Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 35.0,
                                            color: color,
                                          ),
                                          Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 40.0,
                                            color: color,
                                          ),
                                          Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 45.0,
                                            color: color,
                                          ),
                                          Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 50.0,
                                            color: color,
                                          ),
                                          Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 55.0,
                                            color: color,
                                          ),
                                          Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 60.0,
                                            color: color,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  cart.neon!,
                                  style: AppTextStyle.white1,
                                ),
                                IconButton(
                                    onPressed: () {
                                      cartController.deleteCartItem(
                                        itemId: cart.id!,
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.red,
                                    ))
                              ],
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            );
    });
  }
}
