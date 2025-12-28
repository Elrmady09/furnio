
import 'package:flutter/material.dart';

class OrdersProvider extends ChangeNotifier {
  /// Order
  final List<Map<String, dynamic>> _orders = [];

  List<Map<String, dynamic>> get orders => _orders;

  void addOrder(Map<String, dynamic> order) {
    // كل الطلبات القديمة تصبح مكتملة
    for (var order in _orders) {
      order['status'] = 'completed';
    }

    _orders.add(order);
    notifyListeners();
  }


  int selectedTab = 0; // 0 = Active , 1 = Completed

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  /// ✅ الطلبات المعروضة حسب التبويب
  List<Map<String, dynamic>> get filteredOrders {
    if (selectedTab == 0) {
      // Active
      return _orders.where((order) => order['status'] == 'delivery').toList();
    } else {
      // Completed
      return _orders.where((order) => order['status'] == 'completed').toList();
    }
  }
}
