import 'package:customneon/app_bindings.dart';
import '../app_routes.dart';
import 'package:customneon/utills/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_strategy/url_strategy.dart';

Future main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
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
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            iconTheme: IconThemeData(
              color: AppColors.orange,
            ),
            brightness: Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Customs Neon',
          initialBinding: createBindings(context),
          initialRoute: dashboardRoute,
          getPages: appRoutes,
        );
      },
    );
  }
}
