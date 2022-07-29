// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/login.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/widgets/couponRedeem.dart';
import 'package:tip_pay/widgets/input.dart';
import 'package:tip_pay/screens/bottom_nav.dart';
import 'package:tip_pay/screens/signup.dart';
import 'package:tip_pay/widgets/savedBiller.dart';
import 'package:tip_pay/widgets/totalSpendAndDeposit.dart';
import '../stateManagement/controller.dart';
import '../widgets/biller_list_item.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  StateController stateController = Get.put(StateController());
  static String id = 'Profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SizedBox(
            width: double.infinity,
            child: ButtonText('Logout', () => {Get.offAll(Login())})),
      ),
      body: SafeArea(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good day,',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 40),
                            ),
                            Obx(
                              () => Text(
                                "${stateController.user.lastName}, ${stateController.user.firstName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              '4th Year Computer Science',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                            Obx(
                              () => Text(
                                "${stateController.user.studentNumber}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                        CircleImage(100)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TotalSpendAndDeposit(),
                    SavedBiller(),
                    CouponRedeem(),
                  ]))),
    );
  }
}
