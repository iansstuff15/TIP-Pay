// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/widgets/card.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/screens/pay_main.dart';
import 'package:tip_pay/screens/receive_main.dart';
import 'package:tip_pay/screens/topup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  static String id = 'home';
  final String studentid;
  const Home({
    Key? key,
    required this.studentid,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Future getval() async{
      final docacc = await FirebaseFirestore.instance.collection("Account").doc().get();
    }
    print(studentid);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
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
              SizedBox(
                height: 20,
              ),
              CardContainer(),
              SizedBox(
                height: 20,
              ),
              Row(
                // spacing: 100,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "₱12,394.0",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Total Spending",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Month of May",
                        style: TextStyle(
                          fontSize: 15,
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
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Total Deposits",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Month of May",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    child: Ink(
                        padding: const EdgeInsets.all(15),
                        width: width * .275,
                        height: height * .150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade900),
                        child: InkWell(
                          onTap: () {
                            Get.to(PayMain());
                          },
                          child: Column(
                            children: [
                              const Icon(
                                Icons.attach_money,
                                size: 53,
                                color: Colors.white,
                              ),
                              const Text(
                                "Pay",
                                style: TextStyle(
                                  fontSize: 18,
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
                      width: width * .275,
                      height: height * .150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade900),
                      child: InkWell(
                        onTap: () {
                          Get.to(Receive());
                        },
                        child: Column(
                          children: [
                            const Icon(
                              Icons.waving_hand,
                              size: 53,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "Receive",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: Ink(
                        padding: const EdgeInsets.all(15),
                        width: width * .275,
                        height: height * .150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade900),
                        child: InkWell(
                          onTap: () {Get.to(TopupScreen());},
                          child: Column(
                            children: [
                              const Icon(
                                Icons.account_balance_wallet,
                                size: 53,
                                color: Colors.white,
                              ),
                              const Text(
                                "Top-up",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
