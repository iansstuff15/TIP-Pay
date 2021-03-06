import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tip_pay/firebase_options.dart';
import 'dart:io';


final db = FirebaseFirestore.instance;
List<List<String>> itemList = [];
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<QuerySnapshot> streamQuery = FirebaseFirestore.instance.collection('Transac').snapshots();
  @override
  void initState(){
    super.initState();
    itemList = [<String>["Biller_id", "Biller_name", "Item_name", "Price", "Student_id", "Trans_date"]];
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: StreamBuilder<QuerySnapshot>(
          stream: streamQuery,
          builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center (child: CircularProgressIndicator());
            }
            else{
              return Container(
                child: Column(children: <Widget>[
                  Expanded(child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context,index){
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        itemList.add(<String>[doc.get("Biller_id").toString(), doc.get("Biller_name"), doc.get("Item_name"),
                          doc.get("Price").toString(), doc.get("Student_id").toString(), doc.get("Trans_date").toDate().toString()]);
                        print(itemList.toString());
                        return Column();
                      }
                  ))
                ],),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.file_download),
          onPressed: ()=> {
            generateCsv(),
          },
        ),
      ),
    );
  }
}

generateCsv() async{
  print("test OK");
  String csvData = ListToCsvConverter().convert(itemList);
  final dir = await getExternalStorageDirectory();
  //Directory generalDownloadDir = Directory('storage/emulated.0/Download');
  final File file = await (File('${dir?.path}/transac.txt').create());
  await file.writeAsString(csvData);
  print("Stored in $dir");
}


