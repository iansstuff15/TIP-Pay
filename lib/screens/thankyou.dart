import 'package:flutter/material.dart';

class ThankYou extends StatelessWidget {
  static String id = 'Thankyou';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
            child: Column(
          children: [Text('Thank you')],
        )),
      ),
    );
  }
}
