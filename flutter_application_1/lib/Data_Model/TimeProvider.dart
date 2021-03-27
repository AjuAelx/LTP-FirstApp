import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  DateTime time;
  DateTime getTime() => time;

  updateDateTime() {
    time = DateTime.now();
    notifyListeners();
  }
}
