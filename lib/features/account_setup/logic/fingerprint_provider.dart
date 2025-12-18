import 'dart:async';
import 'package:flutter/material.dart';

class FingerprintProvider extends ChangeNotifier {
  double scanProgress = 0.0; // من 0 إلى 100
  bool isComplete = false;


  /// يبدأ عملية المسح بشكل تدريجي
  void startScan() {
    scanProgress = 0;
    isComplete = false;

    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (scanProgress >= 100) {
        isComplete = true;
        notifyListeners();
        timer.cancel();
      } else {
        scanProgress += 2; // نسبة الزيادة
        notifyListeners();
      }
    });
  }

  void reset() {
    scanProgress = 0;
    isComplete = false;

    notifyListeners();
  }

  


}
