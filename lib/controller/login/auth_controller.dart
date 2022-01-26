import 'dart:convert';

import 'package:flutter_login_api/constants/api_constant.dart';
import 'package:flutter_login_api/utils/secure_data.dart';
import 'package:flutter_login_api/model/user_data.dart';
import 'package:flutter_login_api/view/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  UserData userData = UserData();
  var isLoading = false.obs;
  final secureData = SecureData();
  Future<void> login(String email, String password, String userName,
      String mobile, bool isLogin) async {
    print("function call" + ApiConstant.login);
    print("function call" + email);
    print("function call" + password);
    print("function call" + userName);
    print("function call" + mobile);
    print("function call" + isLogin.toString());

    if (isLogin) {
      try {
        isLoading.value = true;
        final response = await http.post(
          Uri.parse(ApiConstant.login),
          body: {
            'email': email,
            'password': password,
          },
        );
        print("Hello");
        if (response.statusCode == 200) {
          userData = UserData.fromJson(
              jsonDecode(response.body) as Map<String, dynamic>);
          secureData.writeSecureData('email', email);
          secureData.writeSecureData('token', userData.token!);
          isLoading.value = false;
          Get.offAll(const HomeScreen());
        }
      } catch (error) {
        isLoading.value = false;
        print("Error." + error.toString());
      }
    }
  }
}
