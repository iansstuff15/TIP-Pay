import 'package:flutter/material.dart';
import 'package:tip_pay/widgets/transaction_list_item.dart';

class RecentTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
      ),
      const Text(
        'Recent Transactions',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      const SizedBox(
        height: 10,
      ),
      SingleChildScrollView(
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TransactionListItem(),
            // ignore: prefer_const_constructors
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: 5),
      )
    ]));
  }
}
