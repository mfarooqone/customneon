import 'package:customneon/desktop_view/auth_view/signup_view.dart';
import 'package:customneon/mobile_view/mobile_view.dart';
import 'package:customneon/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const MobileView(),
        desktopBody: SignupView(),
      ),
    );
  }
}
