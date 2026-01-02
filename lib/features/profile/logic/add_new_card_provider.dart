
import 'package:flutter/cupertino.dart';

enum CardField { number, name, expDate, cvv }

class AddNewCardProvider extends ChangeNotifier{


  /// =========================
  /// Controllers
  /// =========================
  final Map<CardField, TextEditingController> _controllers = {
    for (final field in CardField.values) field: TextEditingController(),
  };

  TextEditingController controller(CardField field) => _controllers[field]!;

  /// =========================
  /// Errors
  /// =========================
  final Map<CardField, String?> _errors = {
    for (final field in CardField.values) field: null,
  };

  String? error(CardField field) => _errors[field];

  void _setError(CardField field, String? message) {
    _errors[field] = message;
  }

  /// =========================
  /// Validation
  /// =========================
  bool validateCardInputs() {
    bool ok = true;

    /// Clear previous errors
    for (final field in CardField.values) {
      _errors[field] = null;
    }

    final number = controller(CardField.number).text;
    final name   = controller(CardField.name).text;
    final exp    = controller(CardField.expDate).text;
    final cvv    = controller(CardField.cvv).text;

    /// Card Number
    if (number.isEmpty || number.length != 16) {
      _setError(CardField.number, 'Card number must be 16 digits');
      ok = false;
    }

    /// Card Name
    if (name.isEmpty) {
      _setError(CardField.name, 'Card name is required');
      ok = false;
    }

    /// Expiry Date (MMYY)
    if (exp.length != 4) {
      _setError(CardField.expDate, 'Invalid expiry date');
      ok = false;
    } else {
      final month = int.tryParse(exp.substring(0, 2)) ?? 0;
      if (month < 1 || month > 12) {
        _setError(CardField.expDate, 'Invalid month');
        ok = false;
      }
    }
    /// CVV
    if (cvv.length != 3) {
      _setError(CardField.cvv, 'CVV must be 3 digits');
      ok = false;
    }

    notifyListeners();
    return ok;
  }
  /// =========================
  /// error messages
  /// =========================

  List<String> getAllErrors() {
    return CardField.values
        .map((field) => _errors[field])
        .where((error) => error != null)
        .cast<String>()
        .toList();
  }

  /// =========================
  /// Clear Inputs
  /// =========================
  void clearCardInputs() {
    for (final controller in _controllers.values) {
      controller.clear();
    }

    for (final field in CardField.values) {
      _errors[field] = null;
    }

    notifyListeners();
  }

  /// =========================
  /// Dispose
  /// =========================
  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }


}