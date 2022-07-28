// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tip_pay/stateManagement/controller.dart';
import 'package:csv/csv.dart';
import 'dart:io';

class TransactionListItemFull extends StatelessWidget {
  StateController stateController = Get.find<StateController>();

  final Map data;
  TransactionListItemFull({Key? key,
    required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Text(data["Transaction_date"].toDate().toString())
          ],
        ),
        Text(data["Type"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(data["Price"].toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    ));
  }
}

generateCsv(List<List<String>> itemList) async{
  print("test OK");
  String csvData = ListToCsvConverter().convert(itemList);
  final dir = await getExternalStorageDirectory();
  //Directory generalDownloadDir = Directory('storage/emulated.0/Download');
  final File file = await (File('${dir?.path}/transac.txt').create());
  await file.writeAsString(csvData);
  print("Stored in $dir");
  Get.snackbar('Success', 'Exported to $dir',
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      colorText: Colors.white,
      backgroundColor: Colors.green);
}
