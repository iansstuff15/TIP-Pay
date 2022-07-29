// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/stateManagement/controller.dart';

class TransactionListItem extends StatelessWidget {
  StateController stateController = Get.find<StateController>();
  final Map data;
  TransactionListItem({Key? key,
    required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              data["Type"]!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Text(
              data["Transaction_date"]!=null?
              data["Transaction_date"].toDate().toString():
              'No Timestamp'
              )
          ],
        ),
        Text(data["Price"].toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
        
      ],
    ));
  }
}
