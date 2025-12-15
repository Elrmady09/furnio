
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Error states
  String? emailError;
  String? passwordError;
  String? firebaseError;


  bool isLoading = false;


  /// =========================
  /// Validation
  /// =========================
  bool validateInputs() {
    emailError = null;
    passwordError = null;
    firebaseError = null;


    bool ok = true;

    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty) {
      emailError = 'Email is required';
      ok = false;
    } else if (!email.endsWith('@gmail.com')) {
      emailError = 'Email must be a Gmail address';
      ok = false;
    }

    if (password.isEmpty) {
      passwordError = 'Password is required';
      ok = false;
    } else if (password.length < 6 || password.length > 20) {
      passwordError = 'Password must be 6–20 characters';
      ok = false;
    }

    notifyListeners();
    return ok;
  }


  /// =========================
  /// Firebase Sign Up
  /// =========================
  Future<bool> signUpWithEmail() async {
    if (!validateInputs()) return false;

    try {
      isLoading = true;
      notifyListeners();

      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        firebaseError = 'This email already exists';
      } else if (e.code == 'weak-password') {
        firebaseError = 'Password is too weak';
      } else if (e.code == 'invalid-email') {
        firebaseError = 'Invalid email address';
      } else {
        firebaseError = 'Something went wrong';
      }

      notifyListeners();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
