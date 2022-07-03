// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  String? label;
  VoidCallback? onPressed;
  ButtonText(
    this.label,
    this.onPressed
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
      onPressed: onPressed,
      child: Text(label!),
    ));
  }
}
