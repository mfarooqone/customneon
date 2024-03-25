import 'package:customneon/controllers/cart_controller.dart';
import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/models/user_model.dart';
import 'package:customneon/utills/image_path.dart';
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

  UserModel? storedUser;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUser();
    });
    super.initState();
  }

  void getUser() async {
    cartController.isLoading.value = true;
    storedUser = await AppPreferencesController.getUser();
    cartController.isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (storedUser!.cart != null)
            ListView.builder(
              itemCount: storedUser!.cart!.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Image.asset(
                      AppImagePath.bgImage,
                      width: 10.w,
                      height: 10.h,
                    ),
                  ],
                );
              },
            )
        ],
      ),
    );
  }
}
