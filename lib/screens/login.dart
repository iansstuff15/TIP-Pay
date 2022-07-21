// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/home.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/screens/bottom_nav.dart';
import 'package:tip_pay/screens/signup.dart';
import 'package:tip_pay/helper/data_manage.dart';

class Login extends StatelessWidget {
  final studentid = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  static String id = 'Login';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Input('Student No.', TextInputType.number, false, studentid),
                  SizedBox(
                    height: 10,
                  ),
                  Input('Email', TextInputType.emailAddress, false, email),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    'Password',
                    TextInputType.text,
                    true,
                    password,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonText('Login', () async {
                        final response = await DatabaseManager().login(
                            email.text,
                            password.text,
                            int.parse(studentid.text));
                        Get.snackbar(
                            response.contains('Welcome back')
                                ? 'Success'
                                : 'Error',
                            response,
                            backgroundColor: response.contains('Welcome back')
                                ? Colors.green
                                : Colors.red,
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.white,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20));
                        if (response.contains('Welcome back')) {
                          Get.to(BottomNav());
                        }
                      }),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.to(Signup()),
                    child: Text(
                      "Dont have an account yet? Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ))),
    );
  }
}
