import 'dart:developer';

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

        final firstName = account['First_name'];
        if (GetUtils.isEqual(studentNumber!, account['Student_id'])) {
          stateController.setUserData(
              uid,
              account['First_name'],
              account['Last_name'],
              account['Email'],
              account['Student_id'],
              account['Total_deposits'],
              account['Total_spending'],
              account['balance']);
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

        final docacc = accountcollection.doc(uid);
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
