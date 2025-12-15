import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Error states
  String? emailError;
  String? passwordError;
  String? firebaseError;


  bool isLoading = false;
  bool rememberMe = false;

  /// =========================
  /// RememberMe
  /// =========================

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

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
      firebaseError = _mapFirebaseError(e);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// =========================
  /// Firebase SIGN IN
  /// =========================
  Future<bool> signInWithEmail() async {
    emailError = null;
    passwordError = null;
    firebaseError = null;

    if (!validateInputs()) return false;

    try {
      isLoading = true;
      notifyListeners();

      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      firebaseError = _mapFirebaseError(e);
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// =========================
  /// Firebase Error Mapper
  /// =========================
  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Wrong password';
      case 'email-already-in-use':
        return 'Email already in use';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password is too weak';
      default:
        return 'Authentication error';
    }
  }

  /// =========================
  /// Clear Controllers
  /// =========================
  void clear() {
    emailController.clear();
    passwordController.clear();
    emailError = null;
    passwordError = null;
    firebaseError = null;
    notifyListeners();
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


}