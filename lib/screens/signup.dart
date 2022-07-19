// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/home.dart';
import 'package:tip_pay/screens/login.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/helper/data_manage.dart';

class Signup extends StatelessWidget {
  final studentid = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  static String id = 'Signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Input('First Name.', TextInputType.text, false, firstName,
                          true),
                      SizedBox(
                        height: 10,
                      ),
                      Input('Last Name', TextInputType.emailAddress, false,
                          lastName, true),
                      SizedBox(
                        height: 10,
                      ),
                      Input('Student No.', TextInputType.number, false,
                          studentid),
                      SizedBox(
                        height: 10,
                      ),
                      Input('Email', TextInputType.emailAddress, false, email),
                      SizedBox(
                        height: 10,
                      ),
                      Input('Password', TextInputType.text, true, password),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonText('Signup', () async {
                            final response = await DatabaseManager().createacc(
                                int.parse(studentid.text),
                                email.text,
                                password.text,
                                firstName.text,
                                lastName.text);
                            Get.snackbar(
                                response == 'logging you in'
                                    ? 'Success'
                                    : 'Error',
                                response,
                                backgroundColor: response == 'logging you in'
                                    ? Colors.green
                                    : Colors.red,
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20));

                            if (response == 'logging you in') {
                              Get.to(Home());
                            }
                          })
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          "Already have an account? Sign in",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
