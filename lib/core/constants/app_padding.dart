import 'package:flutter/material.dart';

class AppPadding {
  /// Padding أساسي لكل الصفحات
  static EdgeInsets pagePadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.symmetric(
      horizontal: size.width * 0.04,
      vertical: 10,
    );
  }

  static EdgeInsets headerWithLogoPadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.only(left: size.width * 0.04,right:size.width * 0.04,top: 10 );
  }

  static EdgeInsets checkoutPricePadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: 10 );
  }

  static EdgeInsets horizontal(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.symmetric(horizontal: size.width * 0.05);
  }


  static EdgeInsets vertical(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.symmetric(vertical: size.height * 0.02);
  }
}
