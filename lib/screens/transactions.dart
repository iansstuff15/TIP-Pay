// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tip_pay/widgets/transaction_list_item_full.dart';
import 'package:get/get.dart';
import 'package:tip_pay/stateManagement/controller.dart';
import '../widgets/button_text.dart';
import '../widgets/transaction_list_item.dart';
import 'package:tip_pay/helper/data_manage.dart';

class Transactions extends StatelessWidget {
  static String id = 'Transactions';
  List<List<String>> transList = [<String>["Payment Type", "  Price", " Transaction Date"]];
  StateController stateController = Get.find<StateController>();
  final Stream<QuerySnapshot> transacFirebase = DatabaseManager().retrieve(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Transactions',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
          
                      StreamBuilder<QuerySnapshot>(
                        stream: transacFirebase,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
                          {
                            if(snapshot.hasError){
                              return Text('Something wrong');
                            }
                    
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Text("Loading");
                              
                            }
                            return Container(
                              height: 600,
                              child: ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                                  addList(data);
                                  return TransactionListItemFull(data: data);
                                }).toList()
                              ),
                            );
                          }
                        ),
                        SizedBox(height:10),
                        ButtonText('Export', ()=>{generateCsv(transList) })
          // SingleChildScrollView(
          //     child: ListView.separated(
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           transList.add(<String>["   ${stateController.user.transactions[index]["Type"]}",
          //             "    ${stateController.user.transactions[index]['Price'].toString()}",
          //             "  ${stateController.user.transactions[index]["Transaction_date"].toDate().toString()}"
          //       ]);
          //           return TransactionListItemFull(index: index);},
          //         separatorBuilder: (context, index) => SizedBox(
          //               height: 10,
          //             ),
          //         itemCount: stateController.user.transactions.value.length,),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // ButtonText('Export', ()=>{generateCsv(transList) })
                    ],
                  ),
                )
            )
        )
      );
  }
  addList(data){
    transList.add(<String>[
      data['Type'],
      data['Price'].toString(),
      data['Transaction_date'].toDate().toString()
      ]);    
  }
}
