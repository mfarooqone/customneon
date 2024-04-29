import 'package:customneon/controllers/my_orders_controller.dart';
import 'package:customneon/screens/footer/footer_design.dart';
import 'package:customneon/screens/header/header_design.dart';
import 'package:customneon/screens/homepage/homepage.dart';
import 'package:customneon/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class MyOrdersScreen extends StatefulWidget {
  static const routeName = '/myorders';
  const MyOrdersScreen({Key? key}) : super(key: key);
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final MyOrdersController myOrdersController = Get.put(MyOrdersController());

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   // await cartController.getCartData();
    // });
    super.initState();
  }

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
            inAsyncCall: myOrdersController.isLoading.value,
            progressIndicator: const LoadingIndicator(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HeaderDesign(),

                    const Text("My Orders"),

                    ///
                    ///
                    ///

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
}
