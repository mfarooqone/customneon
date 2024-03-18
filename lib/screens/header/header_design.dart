import 'package:customneon/controllers/preference_controller.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:customneon/screens/user_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

import '../homepage/homepage.dart';

class HeaderDesign extends StatelessWidget {
  const HeaderDesign({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppPreferencesController prefs = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.offAll(const HomePage(), transition: Transition.noTransition);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.height / 8,
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () async {
              bool isLogedIn = await prefs.getBool(key: "isLogedIn");

              isLogedIn
                  ? Get.to(() => const UserScreen())
                  : Get.to(() => SigninView());
            },
            icon: const Icon(
              PhosphorIconsBold.user,
            ),
          ),

          ///
          IconButton(
            onPressed: () {},
            icon: const Icon(
              PhosphorIconsBold.shoppingCart,
            ),
          ),
        ],
      ),
    );
  }
}
