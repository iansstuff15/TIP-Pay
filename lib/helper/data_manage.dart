import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager{
  final CollectionReference collection_account =
    FirebaseFirestore.instance.collection("Account");

    Future getAccount(studentid) async{
      try{
        final account = await collection_account.doc(studentid).get();
        return account;
      }catch (e){
        print(e.toString());
        return null;
      }
    }

    Future payAccount() async {
      final account = await collection_account.doc('1911942').get();
      final balance = account.get('balance');
      final json = {
        'balance': balance-150
      };
      await collection_account.doc('1911942').set(json, SetOptions(merge: true));


    }

    Future createacc(
        studentid, 
        email, 
        password,
        Fname,
        Lname,
      ) async {
      print(studentid.text);
      print(email.text);
      print(password.text);
      final docacc = collection_account.doc(studentid.text);
      final json = {
        "Student_id": studentid.text,
        "First_name": Fname.text,
        "Last_name": Lname.text,
        "Email": email.text,
        "Password": password.text,
        "Total_spending": 0,
        "Total_deposits": 0,
        "balance": 0,
        "redeem_promo": 0
      };
      await docacc.set(json);
    }
}