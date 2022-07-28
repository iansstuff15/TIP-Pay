// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/helper/data_manage.dart';
import '../stateManagement/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TotalSpendAndDeposit extends StatelessWidget {
  StateController stateController = Get.put(StateController());
  final Stream<DocumentSnapshot> balFirebase = DatabaseManager().retrievebal();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder <DocumentSnapshot>(
        stream: balFirebase,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Something wrong');
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return Text("Loading");

          }
          return (Row(
            // spacing: 100,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "₱${snapshot.data!['Total_spending']}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                  Text(
                    "Total Spending",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Month of May",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              // const SizedBox(width: 100),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                      "₱${snapshot.data!['Total_deposits']}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  Text(
                    "Total Deposits",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Month of May",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ));
        }
    );

  }
}
