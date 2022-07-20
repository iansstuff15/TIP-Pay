// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tip_pay/screens/generate_qr.dart';
import 'package:tip_pay/widgets/billingInformation.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/widgets/recentTransactions.dart';

class Receive extends StatefulWidget {
  @override
  static String id = 'Receive';
  Receive_ createState() => Receive_();
}

class Receive_ extends State<Receive> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            "Receive",
            style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          BillingInformation(),
          const SizedBox(height: 20),

          //AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          Material(
            child: Ink(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                height: height * .140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade900),
                child: InkWell(
                  onTap: () {
                    Get.to(GenerateQR());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 70,
                        color: Colors.white,
                      ),
                      // const Spacer(),
                      const SizedBox(width: 15),
                      const Text(
                        "Generate QR Code",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 18),
                    ],
                  ),
                )),
          ),
          RecentTransactions(),
        ]),
      ),
    ));
  }
}
