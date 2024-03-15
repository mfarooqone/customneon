import 'package:customneon/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthController authController = Get.find();
  User? user;

  @override
  void initState() {
    user = auth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return authController.isLoading.value
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  if (user != null)
                    Text(
                      user!.displayName ?? 'No Display Name',
                    ),
                  ElevatedButton(
                      onPressed: () {
                        authController.logout();
                      },
                      child: const Text("Logout"))
                ],
              );
      }),
    );
  }
}
