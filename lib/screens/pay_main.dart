// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/input_biller.dart';
import 'package:tip_pay/screens/scanner_qr.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/widgets/savedBiller.dart';

import '../widgets/recentTransactions.dart';

class PayMain extends StatefulWidget {
  @override
  static String id = 'PayMain';
  PayMain_ createState() => PayMain_();
}

class PayMain_ extends State<PayMain> {
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
            "Pay",
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            // spacing: 100,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "₱12,394.0",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    "Total Spending",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Month of May",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              // const SizedBox(width: 100),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "₱122,394.0",
                    style: TextStyle(
                      fontSize: 23,
                    ),
                  ),
                  Text(
                    "Total Deposits",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Month of May",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          //AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                child: Ink(
                    padding: const EdgeInsets.all(15),
                    width: width * .420,
                    height: height * .180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade900),
                    child: InkWell(
                      onTap: () {
                        Get.to(ScannerQR());
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.qr_code_scanner,
                            size: 56,
                            color: Colors.white,
                          ),
                          const Text(
                            "with QR",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Material(
                child: Ink(
                  padding: const EdgeInsets.all(15),
                  width: width * .420,
                  height: height * .180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade900),
                  child: InkWell(
                    onTap: () {
                      Get.to(InputBiller());
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.receipt_long_outlined,
                          size: 56,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Input \nBiller",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SavedBiller(),
          RecentTransactions(),
        ]),
      ),
    )));
  }
}
