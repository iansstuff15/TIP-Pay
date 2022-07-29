// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../stateManagement/controller.dart';

class BillingInformation extends StatelessWidget {
  StateController stateController = Get.find<StateController>();

  @override
  Widget build(BuildContext context) {
    return (Row(
      // spacing: 100,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Billing Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Account Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() => Text(
                  "${stateController.user.lastName}, ${stateController.user.firstName}.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ],
        ),
        // const SizedBox(width: 100),
        // const SizedBox(width: 16),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 27,
            ),
            Text(
              "Account Number",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Obx(() => Text(
                  stateController.user.studentNumber.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )),
          ],
        ),
      ],
    ));
  }
}
