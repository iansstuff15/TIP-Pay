// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/widgets/totalSpendAndDeposit.dart';

import '../widgets/billingInformation.dart';

class GenerateQR extends StatefulWidget {
  @override
  static String id = 'GenerateQR';
  GenerateQR_ createState() => GenerateQR_();
}

class GenerateQR_ extends State<GenerateQR> {
  final inputQR = TextEditingController();
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleImage(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Generate QR",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                BillingInformation(),
                SizedBox(
                  height: 10,
                ),
                TotalSpendAndDeposit(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: QrImage(
                    data: "30k TIP",
                    size: 300,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Center qrImage(String text) {
    return Center(
      child: QrImage(
        data: inputQR.text,
        size: 300,
      ),
    );
  }
}
