// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TransactionListItemFull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            const Text('date')
          ],
        ),
        const Text('Payment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const Text('₱ 20.20',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    ));
  }
}
