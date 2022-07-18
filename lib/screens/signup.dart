// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/login.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/helper/data_manage.dart';


class Signup extends StatelessWidget {
  final studentid = TextEditingController();
  final Fname = TextEditingController();
  final Lname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  static String id = 'Signup';
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
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Input('First Name.', TextInputType.number, false, Fname),
                  SizedBox(
                    height: 10,
                  ),
                  Input('Last Name', TextInputType.emailAddress, false, Lname),
                  SizedBox(
                    height: 10,
                  ),
                  Input('Student No.', TextInputType.number, false, studentid),
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
                    children: [ButtonText('Signup', () => DatabaseManager().createacc(studentid, email, password, Fname, Lname))],
                  ),
                  GestureDetector(
                    onTap: () => Get.to(Login()),
                    child: Text(
                      "Already have an account? Sign in",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ))),
    );
  }
}
