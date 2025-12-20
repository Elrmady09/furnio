import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/dialog/general_dialog.dart';
import 'package:furnio/core/widgets/inputs/general_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/general_header.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/forgot_password_provider.dart';
import '../../logic/new_password_provider.dart';
import '../widgets/remember_me_checkbox.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final newPasswordProvider = context.watch<NewPasswordProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              /// Header
              GeneralHeader(title: 'Create New Password'),
              HeightSpace(space: 0.03),

              /// Image
              Image.asset(
                'assets/image/forgot_password/rest_password.png',
                height: size.height * 0.25,
              ),
              HeightSpace(space: 0.03),

              /// Text
              GeneralText(
                text: 'Create Your New Password',
                sizeText: size.width * 0.045,
              ),
              HeightSpace(space: 0.03),

              /// Input

              GeneralTextField(
                prefixIcon: Icons.lock,
                suffixIcon: Icons.remove_red_eye,
                hintText: 'Password',
                textEditingController:newPasswordProvider.passwordController,
                focusNode: newPasswordProvider.passwordFocus,
                obscureText: true,
              ),
              HeightSpace(space: 0.02),
              GeneralTextField(
                prefixIcon: Icons.lock,
                suffixIcon: Icons.remove_red_eye,
                hintText: 're Password',
                textEditingController:newPasswordProvider.rePasswordController,
                focusNode: newPasswordProvider.rePasswordFocus,
                obscureText: true,
              ),
              

              HeightSpace(space: 0.02),

              const RememberMeCheckbox(),

              const Spacer(),

              GeneralButton(
                text: 'Continue',
                onTap: () async{
                  final forgotProvider = context.read<ForgotPasswordProvider>();
                  final newPasswordProvider = context.read<NewPasswordProvider>();

                  try {
                    await newPasswordProvider.sendResetEmail(
                      forgotProvider.email!,
                    );

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text('Password reset link sent to your email'),
                    //   ),
                    // );

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => GeneralDialog(icon: Icons.beenhere),
                    );
                    await Future.delayed(const Duration(seconds: 5));

                    if (context.mounted) {
                      context.pop();
                      /// pop -> يغلق Dialog
                    }
                    if (context.mounted) {
                      context.go('/home');
                      /// go -> يمسح جميع الصفحات وينتقل لي الصفحه التاليه
                    }

                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Passwords do not match'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
