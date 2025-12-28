import 'package:flutter/material.dart';

class TrackOrderProvider extends ChangeNotifier {

  Map<String, dynamic>? _selectedProduct;

  Map<String, dynamic>? get selectedProduct => _selectedProduct;

  void setProduct(Map<String, dynamic> product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void clear() {
    _selectedProduct = null;
    notifyListeners();
  }

  final List<Map<String, String>> statusList = [
    {
      'title': 'Order In Transit - Dec 17',
      'address': '32 Manchester Ave. Ringgold, GA 30736',
      'time': '15:20 PM',
    },
    {
      'title': 'Order at Customs Port - Dec 16',
      'address': '4 Evergreen Street Lake Zurich, IL 60047',
      'time': '14:40 PM',
    },
    {
      'title': 'Order Shipped - Dec 15',
      'address': '9177 Hillcrest Street Wheeling, WV 26003',
      'time': '11:30 AM',
    },
    {
      'title': 'Order is in Packing - Dec 15',
      'address': '891 Glen Ridge St. Gainesville, VA 20155',
      'time': '10:25 AM',
    },
    {
      'title': 'Verified Payments - Dec 15',
      'address': '55 Summerhouse Dr. Apopka, FL 32703',
      'time': '10:04 AM',
    },
  ];
}
