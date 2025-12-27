import 'package:flutter/material.dart';


class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  // 🔹 إضافة منتج للكارت
  void addToCart(Map<String, dynamic> product) {
    final index = _items.indexWhere(
          (item) => item['name'] == product['name'] &&
                    item['color'].value == product['color'].value,
    );

    if (index != -1) {
      // المنتج موجود → زوّد الكمية
      _items[index]['quantity'] += product['quantity'];
    } else {
      // منتج جديد
      _items.add({
        'image': product['image'],
        'name': product['name'],
        'color': product['color'],
        'colorName': product['colorName'],
        'price': product['price'], // string
        'quantity': product['quantity'],

      });
    }

    notifyListeners();
  }



  void increaseQuantity(int index) {
    _items[index]['quantity']++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_items[index]['quantity'] > 1) {
      _items[index]['quantity']--;
      notifyListeners();
    }
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += double.parse(item['price']) * item['quantity'];
    }
    return total;
  }

  void removeItem(Map<String, dynamic> item) {
    _items.remove(item);
    notifyListeners();
  }


}