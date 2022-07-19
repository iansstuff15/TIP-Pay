// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/screens/bottom_nav.dart';
import 'package:tip_pay/screens/signup.dart';
import 'package:tip_pay/helper/data_manage.dart';
class LoginController extends GetxController{
  var test = "".obs;
  change(String arg){
    test.value = arg;
  }
}
class Login extends StatelessWidget {
  final studentid = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  static String id = 'Login';
  @override
  Widget build(BuildContext context) {
    final cont = Get.put(LoginController());
      Future confirmlogin() async{
      dynamic docacc = await DatabaseManager().getAccount(studentid.text);

      if(docacc != null && docacc.exists){
        print("exists");
        if(email.text == docacc.get("Email") && password.text == docacc.get("Password")){
          print("OK");
          print(cont.test);
          cont.change(studentid.text);
          print(cont.test);
          Get.to(() => BottomNav());
        }
        else{
          const snackBar = SnackBar(content: Text("Invalid Email or Password"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print("Invalid");
        }

      }else{
        const snackBar = SnackBar(content: Text("Student ID does not exist."));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
