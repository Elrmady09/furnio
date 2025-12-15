import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;
  bool rememberMe = false;


  void login(String email, String password) {
    isLoggedIn = true;
    notifyListeners();
  }


  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
  void toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }


}