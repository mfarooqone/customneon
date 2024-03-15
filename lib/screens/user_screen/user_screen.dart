import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    user = auth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (user != null)
            Text(
              user!.displayName ?? 'No Display Name',
            ),
        ],
      ),
    );
  }
}
