import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tip_pay/widgets/transaction_list_item.dart';
import 'package:tip_pay/helper/data_manage.dart';
class RecentTransactions extends StatelessWidget {
  final Stream<QuerySnapshot> transacFirebase = DatabaseManager().retrieve(); 
  @override
  Widget build(BuildContext context) {
    return (
          Column(
            crossAxisAlignment: 
            CrossAxisAlignment.start, 
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Recent Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      height: 100,
                      child: ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return TransactionListItem(data: data);
                        }).toList()
                      ),
                    );
                  }
              ),
              // SingleChildScrollView(
              //   child: ListView.separated(
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) => TransactionListItem(index: index,),
              //       // ignore: prefer_const_constructors
              //       separatorBuilder: (context, index) => SizedBox(
              //             width: 10,
              //           ),
              //       itemCount: 5),
              // )
            ]
          )
        );
  }
}
