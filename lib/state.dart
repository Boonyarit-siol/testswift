import 'package:flutter/material.dart';

import 'main.dart';
import 'person.dart';

class Todo with ChangeNotifier {
  //outer class cannot access
  List<String> tasks = ["Person A", "Person B", "Person C "];
  List<Personal> personalList = [
    Personal(
        name: "A",
        lastName: "AA",
        age: "20",
        phoneNumber: "0999999",
        province: "SG"),
    Personal(
        name: "B",
        lastName: "BB",
        age: "20",
        phoneNumber: "0999999",
        province: "ST"),
    Personal(
        name: "C",
        lastName: "CC",
        age: "20",
        phoneNumber: "0999999",
        province: "SK"),
  ];

  void personalAdd(Personal personal) {
    personalList.add(personal);
    notifyListeners();
  }

  void personalEdit(int index, Personal personal) {
    personalList[index] = personal;
    notifyListeners();
  }

  void personalDelete(int index) {
    personalList.removeAt(index);
    notifyListeners();
  }
}
