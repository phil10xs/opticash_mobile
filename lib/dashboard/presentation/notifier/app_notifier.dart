import 'package:flutter/material.dart';

class MyNotifier with ChangeNotifier {
  MyNotifier();

  final List<Map<String, dynamic>> _data = [
    {
      "id": "1",
      "client": "Netflix",
      "type": "netflix",
      "amount": "-30000",
      "date": "April 26",
      "descr": "Paid for",
    },
    {
      "id": "1",
      "client": "Spectranet",
      "type": "debit",
      "amount": "-30000",
      "date": "April 25",
      "descr": "Paid for",
    },
    {
      "id": "1",
      "client": "Demilade",
      "type": "credit",
      "amount": "-30000",
      "date": "April 26",
      "descr": "Recieved Money From FBN",
    },
    {
      "id": "1",
      "client": "Demilade",
      "type": "credit",
      "amount": "-30000",
      "date": "April 28",
      "descr": "Recieved Money From FBN",
    },
  ];

  List<Map<String, dynamic>> get data => _data;

  var _current = 0;

  int get current => _current;

  set current(int value) {
    if (value != 2) {
      _current = value;
    }

    notifyListeners();
  }
}
