// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/stateManagement/controller.dart';

class TransactionListItem extends StatelessWidget {
  StateController stateController = Get.find<StateController>();
  final int index;
  TransactionListItem({Key? key,
    required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Text(stateController.user.transactions.value[index]["Transaction_date"].toDate().toString())
          ],
        ),
        Text(stateController.user.transactions.value[index]["Price"].toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    ));
  }
}
