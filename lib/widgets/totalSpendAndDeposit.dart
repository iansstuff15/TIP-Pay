// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../stateManagement/controller.dart';

class TotalSpendAndDeposit extends StatelessWidget {
  StateController stateController = Get.put(StateController());
  @override
  Widget build(BuildContext context) {
    return (Row(
      // spacing: 100,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                "₱${stateController.user.totalSpending.toString()}",
                style: TextStyle(
                  fontSize: 18,
                ),
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
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        // const SizedBox(width: 100),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                "₱${stateController.user.totalDeposits.toString()}",
                style: TextStyle(
                  fontSize: 18,
                ),
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
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
