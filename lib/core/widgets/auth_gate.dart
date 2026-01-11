import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class AuthGate extends StatelessWidget {
  final Widget child;

  const AuthGate({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return child; // مسجل دخول
        } else {
          // تحويل باستخدام GoRouter
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/auth?mode=signUp');
          });

          return const SizedBox(); // Widget فارغ مؤقتًا
        }
      },
    );
  }
}
