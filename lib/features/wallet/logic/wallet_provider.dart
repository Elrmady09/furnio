import 'package:flutter/material.dart';

class WalletProvider extends ChangeNotifier {
  double balance = 9372;
  /// Top Up E-Wallet
  // double _topUpAmount = 0;
  // double get topUpAmount => _topUpAmount;
  final TextEditingController topUpController =
  TextEditingController(text: '0');

  double topUpAmount = 0;

  void updateTopUpFromInput(String value) {
    final cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    topUpAmount = cleanValue.isEmpty ? 0 : double.parse(cleanValue);
    notifyListeners();
  }

  void selectTopUpAmount(double amount) {
    topUpAmount = amount;
    topUpController.text = amount.toStringAsFixed(0);
    notifyListeners();
  }

  // تنفيذ الشحن
  void confirmTopUp() {
    balance += topUpAmount;
    notifyListeners();
  }
  void clear(){
    topUpAmount = 0;
    topUpController.text = '0';
    notifyListeners();
  }




  /// Transactions
  final List<Map<String, dynamic>> _transactions = [];
  List<Map<String, dynamic>> get transactions => _transactions;

  void addOrderTransaction({
    required Map<String, dynamic> order,
  }) {
    final List<Map<String, dynamic>> items =
    List<Map<String, dynamic>>.from(order['item']);

    for (final product in items) {
      final double price = double.parse(product['price'].toString());
      final int quantity = int.parse(product['quantity'].toString());
      final double totalPrice = price * quantity;

      _transactions.insert(0, {
        'image': product['image'],
        'name': product['name'],
        'price': totalPrice,
        'quantity': quantity,
        'color': product['color'],
        'colorName': product['colorName'],
        'date': order['date'],
        'promo':order['promo'],
        'type': 'Orders',
      });
    }


    //balance -= double.parse(order['total'].toString());
    notifyListeners();
  }

  /// selected Transactions
  Map<String, dynamic>? _selectedTransaction;
  Map<String, dynamic>? get selectedTransaction => _selectedTransaction;

  void selectTransaction(Map<String, dynamic> transaction) {
    _selectedTransaction = transaction;
    notifyListeners();
  }



  @override
  void dispose() {
    topUpController.dispose();
    super.dispose();
  }


}
