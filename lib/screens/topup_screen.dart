// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'package:tip_pay/screens/generate_qr.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/widgets/button_text.dart';

class TopupScreen extends StatefulWidget {
  @override
  static String id = 'Topup';
  TopupScreen_ createState() => TopupScreen_();
}

class TopupScreen_ extends State<TopupScreen> {
  final amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: SliderButton(
              buttonColor: Colors.black,
              action: () {
                ///Do something here
              },
              label: const Text(
                "Slide to Redeem",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              icon: Container(
                child: Icon(
                  Icons.wallet,
                  size: 30,
                  color: Color.fromARGB(255, 210, 210, 210),
                ),
              )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                "Top-up",
                style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              // const Text(
              //   "Input Biller",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 20),
              Input("Amount", TextInputType.number, false, amount),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }
}
