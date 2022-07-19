import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class DatabaseManager {
  final CollectionReference collection_account =
      FirebaseFirestore.instance.collection("users");

  Future getAccount(uid) async {
    try {
      final account = await collection_account.doc(uid).get();
      log(account.toString());
    } catch (e) {
      return e;
    }
  }

  Future login(
    String? email,
    String? password,
  ) async {
    try {
      if (GetUtils.isEmail(email!)) {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: password!);
        final uid = await credential.user!.uid;
        await getAccount(uid);

        return ('logging you in');
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
    log('${studentid.toString()}  ${email}  ${password}, ${firstName}, ${lastName}');
    if (GetUtils.isEmail(email!)) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password!,
        );

        final uid = await credential.user!.uid;

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
        return ('logging you in');
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
