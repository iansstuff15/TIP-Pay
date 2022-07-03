// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10000),
        child: Image(
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          image: NetworkImage('https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?cs=srgb&dl=pexels-suliman-sallehi-1704488.jpg&fm=jpg'),
          ),
        ),
    );
  }
}