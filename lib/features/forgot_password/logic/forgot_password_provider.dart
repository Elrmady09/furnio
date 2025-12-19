import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  /// اختيار وسيلة الاسترجاع
  int selectedOption = 0;

  bool isLoading = false;

  /// raw data
  String? email;
  String? phone;



  void selectOption(int index) {
    selectedOption = index;
    notifyListeners();
  }

  /// PIN
  final List<TextEditingController> pinControllers =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> pinFocusNode =
  List.generate(4, (_) => FocusNode());

  /// i الانتقال بين الخانات
  void onPinInput(int index, String value) {
    if (value.isNotEmpty) {


      // انتقل للحقل التالي
      if (index < pinFocusNode.length - 1) {
        pinFocusNode[index + 1].requestFocus();
      } else {
        pinFocusNode[index].unfocus();
      }
    }
  }

  void onBackspace(int index) {
    if (pinControllers[index].text.isNotEmpty) {
      // امسح الرقم فقط
      pinControllers[index].clear();
    } else if (index > 0) {
      // رجوع للحقل السابق
      pinFocusNode[index - 1].requestFocus();
      pinControllers[index - 1].clear();
    }
  }
  /// pin Text
  String get pin =>
      pinControllers.map((c) => c.text).join();

  int seconds = 60;
  Timer? _timer;

  void startTimer() {
    seconds = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();
      } else {
        seconds--;
        notifyListeners();
      }
    });
  }

  /// Create password
  bool rememberMe = false;

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  void clearInput() {
    for(var c in pinControllers){
      c.clear();
    }
  }

  void unFocusAll(){
    for(var c in pinFocusNode){
      c.unfocus();
    }
  }


  /// جلب بيانات المستخدم من Firestore
  Future<void> loadUserData(String userEmail) async {
    isLoading = true;
    notifyListeners();

    try {
      final query = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        final data = query.docs.first.data();

        email = data['email'];
        phone = data['phone'];
      }
    } catch (e) {
      debugPrint('Error loading user data: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  String get displayEmail => email ?? '';
  String get displayPhone => phone ?? '';

  /// Masked Email
  String get maskedEmail {
    if (email == null || !email!.contains('@')) return '';

    final parts = email!.split('@');
    final name = parts[0];
    final domain = parts[1];

    if (name.length <= 2) return email!;

    return '${name.substring(0, 2)}***@$domain';
  }

  /// Masked Phone
  String get maskedPhone {
    if (phone == null || phone!.length < 4) return '';

    return '${phone!.substring(0, 3)} ****** ${phone!.substring(phone!.length - 2)}';
  }




  @override
  void dispose() {
    for (var c in pinControllers ) {
      c.dispose();
    }
    for (var c in pinFocusNode ) {
      c.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }
}
