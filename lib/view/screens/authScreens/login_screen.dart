import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_api/controller/login/auth_controller.dart';
import 'package:flutter_login_api/utils/form_validation.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  String _userEmail = "";
  String _userPassword = "";
  String _userName = "";
  String _userMobile = "";
  bool _isLogin = true;
  AuthController authController = Get.put(AuthController());

  TextEditingController _password = TextEditingController();

  Future<void> _submit() async {
    final _isValid = _form.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_isValid) {
      _form.currentState!.save();
      try {
        print("email" + _userEmail);
        print("password" + _userPassword);
        await authController.login(_userEmail.trim(), _userPassword.trim(),
            _userName.trim(), _userMobile.trim(), _isLogin);
      } catch (error) {
        Get.rawSnackbar(title: 'Error', message: '$error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    // print("width : ${Get.width}");
    // // ignore: avoid_print
    // print("height : ${Get.height}");
    return Scaffold(
        body: Form(
      key: _form,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.40,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100)),
                gradient: LinearGradient(
                    colors: [Colors.purple, Color(0xffcc3399)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: const FractionalOffset(0.9 / 2, 0.3),
                    child: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.userAlt,
                            size: 70, color: Colors.white)),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: Text(
                      _isLogin ? "LoginScreen" : "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width:
                  context.isSmallTablet ? Get.width * 0.50 : Get.width * 0.85,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 20, left: 20),
                      child: TextFormField(
                        autocorrect: true,
                        key: ValueKey('email'),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          hintText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          return FormValidation.emailValidation(value);
                        },
                        onSaved: (value) {
                          _userEmail = value!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 20, left: 20),
                      child: TextFormField(
                        key: ValueKey('password'),
                        validator: (value) {
                          return FormValidation.passwordValidation(value);
                        },
                        obscureText: true,
                        controller: _password,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          hintText: 'Password',
                          icon: FaIcon(FontAwesomeIcons.key),
                        ),
                        onSaved: (value) {
                          _userPassword = value!;
                        },
                      ),
                    ),
                  ),
                  if (!_isLogin)
                    Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 20, left: 20),
                            child: TextFormField(
                              key: ValueKey('name'),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                                hintText: 'Name',
                                icon: FaIcon(FontAwesomeIcons.solidUser),
                              ),
                              validator: (value) {
                                return FormValidation.checkIsEmpty(
                                    value, 'name');
                              },
                              onSaved: (value) {
                                _userName = value!;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 20, left: 20),
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              key: ValueKey('mobile'),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                                hintText: 'Mobile',
                                icon: FaIcon(FontAwesomeIcons.mobile),
                              ),
                              validator: (value) {
                                return FormValidation.mobileNoValidation(value);
                              },
                              onSaved: (value) {
                                _userMobile = value!;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              _isLogin
                                  ? "Don't have an account?"
                                  : "Already have an account?",
                              style: TextStyle(color: Colors.grey),
                            )),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin ? "Sign Up" : "Login",
                          style: TextStyle(color: Colors.purpleAccent),
                        ),
                      ),
                    ],
                  ),
                  Obx(() {
                    return authController.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(0.0)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80)))),
                              onPressed: () {
                                _submit();
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.purple,
                                        Color(0xffcc3399)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: double.infinity,
                                      minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    _isLogin ? "LOGIN" : "SIGN UP",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                  }),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
