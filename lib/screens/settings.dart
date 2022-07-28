// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/widgets/button_text.dart';
import 'package:tip_pay/widgets/circleImage.dart';
import 'package:tip_pay/screens/locations.dart';

class Settings extends StatefulWidget {
  @override
  static String id = 'Settings';
  Settings_ createState() => Settings_();
}

class Settings_ extends State<Settings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleImage(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "Darkmode",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.yellowAccent[100],
                        activeColor: Colors.yellow,
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(
                      height: 40,
                    ),
                ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
                      onPressed: () {
                      setState(() {
                        Get.to(Location());
                      });
                    },
                      child: Text("Locations"),
                    )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
