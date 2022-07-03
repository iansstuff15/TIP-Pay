// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tip_pay/widgets/card.dart';
import 'package:tip_pay/widgets/circleImage.dart';

class Home extends StatelessWidget {
  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: 
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 CircleImage(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CardContainer(),
          ],
        ),
      )
      ),
    );
  }
}
