import 'package:flutter/material.dart';

class QrDataProvider with ChangeNotifier {
  String _miString;

  String get miString => this._miString;

  set miString(String value) {
    this._miString = value;
    notifyListeners();
  }
}
