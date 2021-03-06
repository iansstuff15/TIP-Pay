// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/screens/profile.dart';

class CircleImage extends StatelessWidget {
  double? size;

  CircleImage([this.size]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Profile());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10000),
        child: Image(
          width: size != null ? size : 50,
          height: size != null ? size : 50,
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?cs=srgb&dl=pexels-suliman-sallehi-1704488.jpg&fm=jpg'),
        ),
      ),
    );
  }
}
