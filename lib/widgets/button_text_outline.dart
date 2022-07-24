// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonTextOutline extends StatelessWidget {
  String? label;
  VoidCallback? onPressed;
  ButtonTextOutline(this.label, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black, width: 3),
          padding: EdgeInsets.symmetric(vertical: 20)),
      child: Text(
        label!,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
      ),
    );
  }
}
