import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier {
  int bottomNavIndex = 0;


  void changeIndex(int newIndex) {
    bottomNavIndex = newIndex;
    notifyListeners();
  }
}