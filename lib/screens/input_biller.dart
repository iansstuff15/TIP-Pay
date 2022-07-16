// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tip_pay/screens/generate_qr.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/widgets/button_text.dart';

class InputBiller extends StatefulWidget {
  @override
  static String id = 'InputBiller';
  InputBiller_ createState() => InputBiller_();
}

class InputBiller_ extends State<InputBiller> {
  final billerid = TextEditingController();
  final billername= TextEditingController();
  final price= TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                "Pay",
                style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Input Biller",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Input("Account Number", TextInputType.number, false,billerid),
              const SizedBox(height: 20),
              Input("Account Name", TextInputType.text, false, billername),
              const SizedBox(height: 20),
              Input("Amount", TextInputType.number, false, price),
              const SizedBox(height: 60),
              SizedBox(
                  height: 50, //height of button
                  width:
                      double.infinity, //width of button equal to parent widget
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text("Pay"),
                    //parameters of Button class
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
