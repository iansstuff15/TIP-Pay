// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/login.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/screens/bottom_nav.dart';
import 'package:tip_pay/main.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatelessWidget {
  final studentid = TextEditingController();
  final Fname = TextEditingController();
  final Lname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  static String id = 'Signup';
  @override
  Widget build(BuildContext context) {
    Future createacc() async {
      print(studentid.text);
      print(email.text);
      print(password.text);
      final docacc = FirebaseFirestore.instance.collection("Account").doc();
      final json = {
        "Student_id": studentid.text,
        "First_name": Fname.text,
        "Last_name": Lname.text,
        "Email": email.text,
        "Password": password.text,
        "Total_spending": 0,
        "Total_deposits": 0,
        "balance": 0,
        "redeem_promo": 0
      };
      await docacc.set(json);
    }

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
                    children: [ButtonText('Signup', () => createacc())],
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
