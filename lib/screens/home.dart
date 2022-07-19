// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/login.dart';
import 'package:tip_pay/widgets/card.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/screens/pay_main.dart';
import 'package:tip_pay/screens/receive_main.dart';
import 'package:tip_pay/screens/topup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tip_pay/helper/data_manage.dart';

class Home extends StatefulWidget {
  static String id = 'home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var total_deposits ='';
  var total_spending = '';
  @override
  final getstudentid = Get.find<LoginController>();

  getTotals() async{
    dynamic t_spending = await DatabaseManager().getAccount(getstudentid.test.value);

    if(t_spending == null){
      print("cannot retrieve data");
    }else{
      setState(() {
        total_spending = t_spending.get('Total_spending').toString();
        total_deposits = t_spending.get("Total_deposits").toString();
      });
    }
    log('$total_spending');
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getTotals();
  }

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
                  Row(
                    // spacing: 100,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                            Text(
                              total_spending,
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
                        children:  [
                          Text(
                            total_deposits,
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

