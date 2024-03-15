import 'package:customneon/app_bindings.dart';
import 'package:customneon/screens/auth_view/signin_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyD0IJTjbpLD-Q95EgCuxbgaiHGJgfHGtCE",
    authDomain: "customsneon-b32ef.firebaseapp.com",
    projectId: "customsneon-b32ef",
    storageBucket: "customsneon-b32ef.appspot.com",
    messagingSenderId: "900142765503",
    appId: "1:900142765503:web:041ea0f6fc7b5f4f16bd0a",
    measurementId: "G-X9V73PMWF3",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Custom Neon',
          home: SigninView(),
          initialBinding: createBindings(context),
        );
      },
    );
  }
}
