// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      decoration: BoxDecoration(
        color: Colors.yellow,
        
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Card')
        ],
      ),
    );
  }
}