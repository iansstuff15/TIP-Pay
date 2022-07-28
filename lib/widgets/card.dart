// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_pay/stateManagement/controller.dart';
import 'package:tip_pay/helper/data_manage.dart';

class CardContainer extends StatelessWidget {
  StateController stateController = Get.find<StateController>();
  final Stream<DocumentSnapshot> balFirebase = DatabaseManager().retrievebal();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 241, 155),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Text(
            stateController.user.studentNumber.toString(),
            style: TextStyle(fontWeight: FontWeight.w600),
          )),
          SizedBox(
            height: 50,
          ),
          Text(
            "Current Balance",
            style: TextStyle(fontSize: 13),
          ),
          StreamBuilder <DocumentSnapshot>(
            stream: balFirebase,
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if(snapshot.hasError){
                  return Text('Something wrong');
                }

                if(snapshot.connectionState == ConnectionState.waiting){
                  return Text("Loading");

                }
                return Text("₱${snapshot.data!['balance']}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)
                );
              }
          ),

          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                    "${stateController.user.lastName}, ${stateController.user.firstName}.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Valid until S.Y. 2024",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
