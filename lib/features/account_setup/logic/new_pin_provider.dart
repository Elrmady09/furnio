

import 'package:flutter/cupertino.dart';

class NewPinProvide extends ChangeNotifier {

  // Controllers
  final TextEditingController first = TextEditingController();
  final TextEditingController second = TextEditingController();
  final TextEditingController third = TextEditingController();
  final TextEditingController fourth = TextEditingController();

  // FocusNodes
  final FocusNode firstNode = FocusNode();
  final FocusNode secondNode = FocusNode();
  final FocusNode thirdNode = FocusNode();
  final FocusNode fourthNode = FocusNode();

  // الانتقال بين الخانات
  void next(FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(current.context!).requestFocus(next);
  }

  // عند الضغط خارج الخانات
  void unFocusAll() {
    firstNode.unfocus();
    secondNode.unfocus();
    thirdNode.unfocus();
    fourthNode.unfocus();
  }

  // إرجاع الـ PIN كاملاً
  String get pin =>
      first.text + second.text + third.text + fourth.text;

  // تنظيف البيانات
  void clear() {
    first.clear();
    second.clear();
    third.clear();
    fourth.clear();
  }

  @override
  void dispose() {
    first.dispose();
    second.dispose();
    third.dispose();
    fourth.dispose();
    firstNode.dispose();
    secondNode.dispose();
    thirdNode.dispose();
    fourthNode.dispose();
    super.dispose();
  }

}