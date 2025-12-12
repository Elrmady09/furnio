import 'package:flutter/material.dart';


class CartProvider extends ChangeNotifier {
  final List<String> items = [];


  void addItem(String item) {
    items.add(item);
    notifyListeners();
  }


  void removeItem(String item) {
    items.remove(item);
    notifyListeners();
  }
}