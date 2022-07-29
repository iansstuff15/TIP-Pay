// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/widgets/card.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/screens/pay_main.dart';
import 'package:tip_pay/screens/receive_main.dart';
import 'package:tip_pay/screens/topup_screen.dart';
import 'package:tip_pay/widgets/recentTransactions.dart';
import 'package:tip_pay/widgets/totalSpendAndDeposit.dart';

class Home extends StatefulWidget {
  static String id = 'home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
              TotalSpendAndDeposit(),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          onTap: () {
                            Get.to(TopupScreen());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              RecentTransactions(),
            ],
          ),
        ),
      )),
    );
  }
}
