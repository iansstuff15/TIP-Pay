// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/stateManagement/controller.dart';

class TransactionListItemFull extends StatelessWidget {
  StateController stateController = Get.find<StateController>();
  final int index;
  TransactionListItemFull({Key? key,
    required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(stateController.user.transactions.value);
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Text(stateController.user.transactions.value[index]["Transaction_date"].toDate().toString())
          ],
        ),
       Text(stateController.user.transactions.value[index]["Type"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(stateController.user.transactions.value[index]["Price"].toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    ));
  }
}
