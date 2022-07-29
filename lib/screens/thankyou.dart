// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/bottom_nav.dart';
import 'package:tip_pay/screens/home.dart';
import 'package:tip_pay/screens/transactions.dart';
import 'package:tip_pay/widgets/button_text_outline.dart';

import '../widgets/button_text.dart';
import '../widgets/circleImage.dart';

class ThankYou extends StatelessWidget {
  static String id = 'Thankyou';
  dynamic argumentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
            height: 120,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ButtonTextOutline(
                      'Go Back to Dashboard', () => {Get.off(BottomNav())}),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ButtonText(
                      'Check Transactions', () => {Get.to(Transactions())}),
                ),
              ],
            )),
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleImage(),
                  ],
                ),
                Text(
                  argumentData[0]!.toString(),
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
                ),
                Text(argumentData[1]!.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 25)),
                const Center(
                  heightFactor: 5,
                  child: const Text(
                    'Success',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 50),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
