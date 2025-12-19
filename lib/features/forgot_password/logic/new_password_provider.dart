
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class NewPasswordProvider extends ChangeNotifier{
  // Controllers
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  // FocusNodes
  final passwordFocus = FocusNode();
  final rePasswordFocus = FocusNode();

  bool statePasswordFocus = false;
  bool stateRePasswordFocus = false;


  NewPasswordProvider() {
    passwordFocus.addListener(() {
      statePasswordFocus = passwordFocus.hasFocus;
      notifyListeners();
    });
    rePasswordFocus.addListener(() {
      stateRePasswordFocus = rePasswordFocus.hasFocus;
      notifyListeners();
    });
  }

  Future<void> sendResetEmail(String email) async {
    if (passwordController.text.isEmpty ||
        rePasswordController.text.isEmpty) {
      throw Exception('EMPTY_FIELDS');
    }

    if (passwordController.text != rePasswordController.text) {
      throw Exception('PASSWORD_NOT_MATCH');
    }

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }






  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();


    passwordFocus.dispose();
    rePasswordFocus.dispose();


    super.dispose();
  }


}