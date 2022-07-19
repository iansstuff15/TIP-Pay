// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class BillerListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Biller Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('12345678'),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Last Transactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text('May 30, 2022'),
              ],
            )));
  }
}
