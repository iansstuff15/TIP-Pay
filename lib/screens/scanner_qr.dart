import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tip_pay/helper/data_manage.dart';
import 'package:tip_pay/screens/input_biller.dart';

class ScannerQR extends StatelessWidget {
  static String id = 'ScannerQR';
  const ScannerQR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) async {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              log('Barcode found! $code');
              final billerAccount = await DatabaseManager().getAccount(code);
              Get.to(() => InputBiller(), arguments: [
                billerAccount['Last_name'],
                billerAccount['First_name'],
                billerAccount['Student_id']
              ]);
            }
          }),
    );
  }
}
