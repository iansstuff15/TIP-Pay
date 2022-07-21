import 'package:get/get.dart';
import 'package:tip_pay/dataModels/user.dart';

class StateController extends GetxController {
  var user = UserData();

  void setUserData(uid, firstName, lastName, email, studentNumber,
      totalDeposits, totalSpending, balance,transactions) {
    user.firstName.value = firstName;
    user.lastName.value = lastName;
    user.email.value = email;
    user.uid.value = uid;
    user.studentNumber.value = studentNumber;
    user.totalDeposits.value = totalDeposits;
    user.totalSpending.value = totalSpending;
    user.balance.value = balance;
    user.transactions = transactions;
  }
}
