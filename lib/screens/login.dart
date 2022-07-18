// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/screens/bottom_nav.dart';
import 'package:tip_pay/screens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class Login extends StatelessWidget {
  final studentid = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  static String id = 'Login';
  @override
  Widget build(BuildContext context) {
      Future confirmlogin() async{
      final docacc = await FirebaseFirestore.instance.collection("Account").doc(studentid.text).get();
      if(docacc.exists){
        print("exists");
        if(email.text == docacc.get("Email") && password.text == docacc.get("Password")){
          print("OK");
          Get.to(() => BottomNav(studentid: studentid.text));
        }
        else{
          print("Invalid");
        }

      }else{
        print("not exist");
      }
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
                      ButtonText('Login', ()=>confirmlogin()),
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
