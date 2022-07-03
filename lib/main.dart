import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tip_pay/screens/home.dart';
import 'package:tip_pay/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    theme: ThemeData(
      fontFamily: 'SF UI Text'
    ),
    home: Login(),
    routes: {
      Login.id: (context)=>Login(),
      Home.id: (context)=>Home(),
    },
    );
  }
}
