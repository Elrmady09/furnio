import 'package:flutter/material.dart';

class PinCodeProvider extends ChangeNotifier {
  bool isSms = true;
  String value = '';

  void setData({required bool sms, required String text}) {
    isSms = sms;
    value = text;
    notifyListeners();
  }
}
