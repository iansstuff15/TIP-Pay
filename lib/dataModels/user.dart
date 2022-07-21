import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class UserData {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var studentNumber = 0.obs;
  var totalDeposits = 0.obs;
  var totalSpending = 0.obs;
  var uid = ''.obs;
  var balance = 0.obs;
  var transactions = [].obs;
}
