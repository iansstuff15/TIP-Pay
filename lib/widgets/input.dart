// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'dart:ui';

import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String? label;
  TextInputType? keyboard;
  bool? obsureText;

  int? maxlength = 1;
  bool textCapitalization;
  String? initialValue;
  TextEditingController controller;
  Input(this.label, this.keyboard, this.obsureText, this.controller,
      [this.textCapitalization = false, this.initialValue]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: keyboard,
        obscureText: obsureText!,
        controller: controller,
        textAlign: TextAlign.start,
        textCapitalization: textCapitalization
            ? TextCapitalization.words
            : TextCapitalization.none,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 210, 210, 210))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 25, 25, 25),
                  width: 1.5,
                )),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 210, 210, 210)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            labelText: label,
            filled: true,
            fillColor: Color.fromARGB(255, 210, 210, 210),
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w800,
            )),
      ),
    );
  }
}
