import 'package:customneon/desktop_view/auth_view/signin_view.dart';
import 'package:customneon/desktop_view/footer/payment_methods.dart';
import 'package:customneon/dummy.dart';
import 'package:customneon/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Custom Neon',
          home: SigninView(),
        );
      },
    );
  }
}
