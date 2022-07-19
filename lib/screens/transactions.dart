// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tip_pay/widgets/transaction_list_item_full.dart';

import '../widgets/transaction_list_item.dart';

class Transactions extends StatelessWidget {
  static String id = 'Transactions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transactions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => TransactionListItemFull(),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: 15)),
        ],
      ),
    ))));
  }
}
