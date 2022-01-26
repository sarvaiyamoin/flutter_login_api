import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_api/utils/secure_data.dart';
import 'package:flutter_login_api/view/screens/home_screen.dart';
import 'package:flutter_login_api/view/screens/authScreens/login_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final secureData = SecureData();
  String? email;
  String? token;
  @override
  void initState() {
    print("Hello");
    secureData.readData('email').then((value) => email = value);
    secureData.readData('token').then((value) => token = value);
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (token == null) {
        Get.offAll(LoginScreen());
      } else {
        Get.offAll(const HomeScreen());
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          "Welcome",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}
