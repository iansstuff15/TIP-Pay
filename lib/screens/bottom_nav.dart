// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tip_pay/screens/home.dart';
import 'package:tip_pay/screens/feedback.dart';
import 'package:tip_pay/screens/settings.dart';
import 'package:tip_pay/screens/transactions.dart';
import 'package:tip_pay/widgets/button_text_outline.dart';
import '../widgets/button_text.dart';
import 'package:get/get.dart';

class BottomNav extends StatefulWidget {
  static String id = 'ButtomNav';
  const BottomNav({Key? key}) : super(key: key);
  @override
  BottomNav_ createState() => BottomNav_();
}

class BottomNav_ extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> pageScreens() => [
        Home(),
        Transactions(),
        LinkGmail(),
        Settings(),
      ];

  @override
  Widget build(BuildContext context) {
    double widthoutline = 60;
    final List<Widget> children = pageScreens();
    return Scaffold(
      body: Home(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
            height: 100,
            width: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widthoutline,
                  child: Column(
                    children: [
                      Icon(Icons.home_rounded),
                      ButtonTextOutline(
                          'Home', () => {Get.to(BottomNav())}),
                    ],
                  ),
                ),
                SizedBox(
                  width: widthoutline,
                  child: Column(
                    children: [
                      Icon(Icons.receipt),
                      ButtonText(
                          'Transac', () => {Get.to(Transactions())}),
                    ],
                  ),
                ),
                SizedBox(
                  width: widthoutline,
                  child: Column(
                    children: [
                      Icon(Icons.support_agent_rounded),
                      ButtonText(
                          'Report', () => {Get.to(LinkGmail())}),
                    ],
                  ),
                ),
                SizedBox(
                  width: widthoutline,
                  child: Column(
                    children: [
                      Icon(Icons.settings),
                      ButtonText(
                          'Settings', () => {Get.to((Settings()))}),
                    ],
                  ),
                ),
              ],
            )),
      ),
      );
  }
}
