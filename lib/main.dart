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
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Custom Neon',
          home: HomePage(),
        );
      },
    );
  }
}
