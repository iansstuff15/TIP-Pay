import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:tip_pay/stateManagement/controller.dart';

class DatabaseManager {
  StateController stateController = Get.put(StateController());
  final CollectionReference collection_account =
      FirebaseFirestore.instance.collection("users");

  Future getAccount(uid) async {
    try {
      final account = await collection_account.doc(uid).get();

      return (account.data());
    } catch (e) {
      return e;
    }
  }

  Future findUserStudentID(int studentID) async {
    try {
      final account = await collection_account
          .where('Student_id', isEqualTo: studentID)
          .get();

      return (account.docs[0].data());
    } catch (e) {
      log(e.toString());
    }
  }

  Future setTransaction(Map<String, dynamic> json, String uid) async {
    try {
      final account = collection_account
          .doc(uid)
          .collection('Transactions')
          .doc()
          .set(json);
      return 'Transaction added';
    } catch (e) {
      return e.toString();
    }
  }

  Future topup(double payment) async{
    double balance = double.parse(stateController.user.balance.toString());
    String uid = stateController.user.uid.toString();
    try {
      final docacc = collection_account.doc(uid);
      final totalSpending = {'Total_spending': FieldValue.increment(0.0)};
      final totalDeposits = {'Total_deposits': FieldValue.increment(payment)};

      final transactionJSON = {
        'Biller_id': uid,
        'Sender_id': stateController.user.uid.toString(),
        'Price': payment,
        'Transaction_date': FieldValue.serverTimestamp(),
        'Type': "Top-Up",
      };

      setTransaction(transactionJSON, uid);
      try {
        final json = {'balance': FieldValue.increment(payment)};
        docacc.update(json);
        setTransaction(transactionJSON, uid);
        docacc.update(totalSpending);
        docacc.update(totalDeposits);
        return (transactionJSON);
      } catch (e) {
        log(e.toString());
        return (e.toString());
      }
    } catch (e) {
      log(e.toString());
      return (e.toString());
    }
  }

  Future payment(double payment, String billerUID, String type) async {
    double balance = double.parse(stateController.user.balance.toString());
    String uid = stateController.user.uid.toString();
    log(balance.toString());
    if (payment < balance) {
      try {
        final docacc = collection_account.doc(uid);
        final json = {'balance': FieldValue.increment(-payment)};
        final totalSpending = {'Total_spending': FieldValue.increment(payment)};
        final totalDeposits = {'Total_deposits': FieldValue.increment(payment)};
        docacc.update(json);

        final transationJSON = {
          'Biller_id': billerUID,
          'Sender_id': stateController.user.uid.toString(),
          'Price': payment,
          'Transaction_date': FieldValue.serverTimestamp(),
          'Type': type,
        };

        setTransaction(transationJSON, uid);
        try {
          final biller = collection_account.doc(billerUID);
          final json = {'balance': FieldValue.increment(payment)};
          biller.update(json);
          setTransaction(transationJSON, billerUID);
          docacc.update(totalSpending);
          biller.update(totalDeposits);
          return (transationJSON);
        } catch (e) {
          log(e.toString());
          return (e.toString());
        }
      } catch (e) {
        log(e.toString());
        return (e.toString());
      }
    } else {
      return "Insufficient funds";
    }
  }

  Stream<QuerySnapshot> retrieve() {
    return collection_account.doc(stateController.user.uid.toString()).collection("Transactions").snapshots();
  }
  Stream<DocumentSnapshot> retrievebal() {
    return collection_account.doc(stateController.user.uid.toString()).snapshots();
  }
  Future getTransacs(uid) async {
    try {
      final accounttrans = await collection_account.doc(uid).collection("Transactions").get();
      final translist = accounttrans.docs.map((doc) => doc.data()).toList();
      return (translist.asMap());
    } catch (e) {
      return e;
    }
  }

  Future login(
    String? email,
    String? password,
    int? studentNumber,
  ) async {
    try {
      if (GetUtils.isEmail(email!)) {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password!);
        final uid = await credential.user!.uid;
        final account = await getAccount(uid);
        final accountTrans = await getTransacs(uid);
        final firstName = account['First_name'];
        if (GetUtils.isEqual(studentNumber!, account['Student_id'])) {
          stateController.setUserData(
            uid,
            account['First_name'],
            account['Last_name'],
            account['Email'],
            account['Student_id'],
            double.parse(account['Total_deposits'].toString()),
            double.parse(account['Total_spending'].toString()),
            double.parse(account['balance'].toString()),
            accountTrans
          );
          await retrieve();
          return ('Welcome back, ${firstName}!');
        } else {
          return ('Student number is not found does not match account\'s student number');
        }
      } else {
        return ('Email input not valid email');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      }
    }
  }

  Future createacc(
    int? studentid,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  ) async {
    // log('${studentid.toString()}  ${email}  ${password}, ${firstName}, ${lastName}');
    if (GetUtils.isEmail(email!)) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password!,
        );

        final uid = credential.user!.uid;

        final docacc = collection_account.doc(uid);
        final body = {
          'UID': uid,
          "Student_id": studentid,
          "First_name": firstName,
          "Last_name": lastName,
          "Email": email,
          "Password": password,
          "Total_spending": 0,
          "Total_deposits": 0,
          "balance": 10000,
          "redeem_promo": 0
        };
        await docacc.set(body);
        return ('Welcome, ${firstName}');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return (e.code);
        } else if (e.code == 'email-already-in-use') {
          return (e.code);
        }
      } catch (e) {
        return (e);
      }
    } else {
      return ('Email input not valid email');
    }
  }
}
