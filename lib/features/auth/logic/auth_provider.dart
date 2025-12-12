import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;


  void login(String email, String password) {
    isLoggedIn = true;
    notifyListeners();
  }


  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}