import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  Color get main => (isLightMode) ? (Color(0xFFF)) : (Color(0x00292929));
  Color get contrast => (isDarkMode) ? (Color(0xFFF)) : (Color(0x00292929));
  Color get style => Color(0xFFA463F5);
  Color get alternative => Color(0xFF00A3FF);
  Color get defaultMain => Color(0xFFF);
  Color get defaultContrast => Color(0x00292929);
  RxBool _isDarkMode = false.obs;
  Color get white => Colors.white;
  Color get black => Colors.black;
  bool get isDarkMode => _isDarkMode.value;
  bool get isLightMode => !(_isDarkMode.value);

  void themeSwitcher() {}
}
