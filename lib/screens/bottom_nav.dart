// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tip_pay/screens/home.dart';
import 'package:tip_pay/screens/linkGmail.dart';
import 'package:tip_pay/screens/settings.dart';

class BottomNav extends StatefulWidget {
  @override
  static String id = 'ButtomNav';
  BottomNav_ createState() => BottomNav_();
}

class BottomNav_ extends State<BottomNav> {
  int currentIndex = 0;
  final pageScreens = [
    Home(),
    const Center(child: Text("Transactions", style: TextStyle(fontSize: 30))),
    LinkGmail(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        iconSize: 40,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: "Transactions"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_rounded),
            label: "Support"
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            ),
        ],
      ),
    );
  }
}