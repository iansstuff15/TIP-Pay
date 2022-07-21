import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class SliderButton extends StatelessWidget {
  double? width;

  SliderButton(this.width);
  @override
  Widget build(BuildContext context) {
    return (SizedBox(
        width: double.infinity,
        child: ConfirmationSlider(
          textStyle:
              TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          width: width! - 40,
          shadow: BoxShadow(
            color: Colors.grey.withOpacity(0.0),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
          text: 'Slide to Pay',
          backgroundColor: Color.fromARGB(255, 210, 210, 210),
          foregroundColor: Colors.black,
          foregroundShape: BorderRadius.circular(12),
          backgroundShape: BorderRadius.circular(12),
          onConfirmation: () => {},
        )));
  }
}
