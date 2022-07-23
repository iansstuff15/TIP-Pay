// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:tip_pay/helper/data_manage.dart';

import 'package:tip_pay/screens/generate_qr.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/slider.dart';

class InputBiller extends StatefulWidget {
  static String id = 'InputBiller';
  @override
  InputBiller_ createState() => InputBiller_();
}

class InputBiller_ extends State<InputBiller> {
  final billerid = TextEditingController();
  final billername = TextEditingController();
  final price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SliderButton(width, () async {
            final billerInfo = await DatabaseManager()
                .findUserStudentID(int.parse(billerid.text));

            log(billerInfo.toString());

            String response = await DatabaseManager().payment(
                double.parse(price.text), billerInfo['UID'], 'payment');

            log(response);
          })),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                          "Pay",
                          style: TextStyle(
                              fontSize: 52, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Input Biller",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Input("Account Number", TextInputType.number, false,
                            billerid),
                        const SizedBox(height: 20),
                        Input("Account Name", TextInputType.text, false,
                            billername),
                        const SizedBox(height: 20),
                        Input("Amount", TextInputType.number, false, price),
                      ]),
                ]),
          ),
        ),
      ),
    );
  }
}
