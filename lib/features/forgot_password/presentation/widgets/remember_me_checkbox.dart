import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/forgot_password_provider.dart';

class RememberMeCheckbox extends StatelessWidget {
  const RememberMeCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ForgotPasswordProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: provider.rememberMe,
          onChanged: (_) => provider.toggleRememberMe(),
        ),
        const Text('Remember me'),
      ],
    );
  }
}
