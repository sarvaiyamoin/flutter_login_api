import 'package:flutter/material.dart';
import 'package:flutter_login_api/utils/secure_data.dart';
import 'package:flutter_login_api/view/screens/authScreens/login_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secureData = SecureData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              secureData.deleteData('token');
              secureData.deleteData('email');
              Get.offAll(LoginScreen());
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Welcome to home screen"),
      ),
    );
  }
}
