import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tip_pay/screens/home.dart';
import 'package:tip_pay/screens/input_biller.dart';
import 'package:tip_pay/screens/login.dart';
import 'package:tip_pay/screens/pay_main.dart';
import 'package:tip_pay/screens/receive_main.dart';
import 'package:tip_pay/screens/settings.dart';
import 'package:tip_pay/screens/feedback.dart';
import 'package:tip_pay/screens/bottom_nav.dart';
import 'package:tip_pay/screens/topup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'SF UI Text'),
      home: Login(),
      routes: {
        Login.id: (context) => Login(),
        Home.id: (context) => Home(),
        PayMain.id: (context) => PayMain(),
        Receive.id: (context) => Receive(),
        Settings.id: (context) => Settings(),
        InputBiller.id: (context) => InputBiller(),
        LinkGmail.id: (context) => const LinkGmail(),
        TopupScreen.id: (context) => TopupScreen(),
      },
    );
  }
}
