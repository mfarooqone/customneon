import 'package:customneon/desktop_view/create_neon/create_neon.dart';
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
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileView(),
        desktopBody: CreateNeon(),
      ),
    );
  }
}
