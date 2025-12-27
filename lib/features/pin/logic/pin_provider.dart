import 'package:flutter/material.dart';

class PinProvider extends ChangeNotifier {
  /// Controller
  final List<TextEditingController> controllers =
  List.generate(4, (_) => TextEditingController());
  ///FocusNode
  final List<FocusNode> focusNodes =
  List.generate(4, (_) => FocusNode());


  /// i الانتقال بين الخانات
  void onPinInput(int index, String value) {
    if (value.isNotEmpty) {


      // انتقل للحقل التالي
      if (index < focusNodes.length - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
      }
    }
  }

  void onBackspace(int index) {
    if (controllers[index].text.isNotEmpty) {
      // امسح الرقم فقط
      controllers[index].clear();
    } else if (index > 0) {
      // رجوع للحقل السابق
      focusNodes[index - 1].requestFocus();
      controllers[index - 1].clear();
    }
  }

  void unFocusAll() {
    for (final node in focusNodes) {
      node.unfocus();
    }
  }

  String get pin =>
      controllers.map((c) => c.text).join();

  void clear() {
    for (final c in controllers) {
      c.clear();
    }
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }
}
