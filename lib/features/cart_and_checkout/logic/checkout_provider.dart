import 'package:flutter/material.dart';
import 'package:furnio/features/cart_and_checkout/data/03_promo_code/promo_code_data.dart';

import '../data/01_shipping_address/shipping_address_data.dart';
import '../data/02_choose_shipping/choose_shipping_data.dart';

class CheckoutProvider extends ChangeNotifier {

  /// ================= Shipping Cost =================
  double shippingCost = 0;
  void setShipping(double value) {
    shippingCost = value;
    notifyListeners();
  }

  /// ================= Shipping Address =================
  int selectedIndex = 0;
  void selectAddress(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  // اختيار المستخدم
  Map<String, String> get selectedAddress =>
      shippingAddresses[selectedIndex];

  /// ================= Choose Shipping =================
  int? selectedShippingIndex;
  void selectShipping(int index) {
    selectedShippingIndex = index;
    //سعر الشحن
    shippingCost = double.parse(chooseShipping[index]['price'] ?? '0');
    notifyListeners();
  }

  // اختيار المستخدم
  Map<String, String>? get selectedShipping {

    if (selectedShippingIndex == null) return null;
    return chooseShipping[selectedShippingIndex!];
  }

  /// ================= Promo Code =================
  int? selectedPromoIndex ;
  void selectPromoCode(int index) {
    selectedPromoIndex = index;
    notifyListeners();
  }

  // اختيار المستخدم
  Map<String, String>? get selectedPromoCode {

    if (selectedPromoIndex == null) return null;
    return promoCodeData[selectedPromoIndex!];
  }

  void deletePromoCode(){
    selectedPromoIndex = null;
    notifyListeners();
  }

  /// ================= Discount Logic =================
  /// قيمة الخصم
  double getDiscount(double itemsTotal) {
    if (selectedPromoCode == null) return 0;

    /// مثال: "Special 25% Off"
    final title = selectedPromoCode!['title']!;

    final percent = double.parse(title.replaceAll(RegExp(r'[^0-9]'), ''));

    return itemsTotal * (percent / 100);
  }

  /// ================= Total =================
  double getTotal(double itemsTotal) {
    final discount = getDiscount(itemsTotal);
    return (itemsTotal + shippingCost) - discount;
  }

  /// ================= Payment Methods =================

  int selectedPaymentMethodsIndex = 0;
  void selectPayment(int index) {
    selectedPaymentMethodsIndex = index;
    notifyListeners();
  }





}
