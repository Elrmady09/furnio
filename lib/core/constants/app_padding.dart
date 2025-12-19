import 'package:flutter/material.dart';

class AppPadding {
  /// Padding أساسي لكل الصفحات
  static EdgeInsets pagePadding(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EdgeInsets.symmetric(
      horizontal: size.width * 0.05,
      vertical: size.height * 0.02,
    );
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
