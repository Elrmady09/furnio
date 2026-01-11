import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/inputs/general_textfield.dart';
import '../../../../../core/widgets/space.dart';

import '../../../../account_setup/data/account_setup_service.dart';
import '../../../logic/auth_provider.dart';
import '../../../logic/auth_mode.dart';

import '../../widgets/auth_header.dart';
import '../../widgets/auth_divider.dart';
import '../../widgets/auth_text_sign.dart';
import '../../widgets/social_icons_row.dart';
import '../../widgets/remember_me_row.dart';

class AuthPage extends StatelessWidget {
  final AuthMode mode;

  const AuthPage({super.key, required this.mode});

  bool get isSignUp => mode == AuthMode.signUp;

  String get title =>
      isSignUp ? "Create Your Account" : "Login To Your Account";

  String get buttonText => isSignUp ? "Sign up" : "Sign in";

  String get successMessage =>
      isSignUp ? "Account created successfully" : "Signed in successfully";
  String get textAccount =>
      isSignUp ? "Already have an account" : "Don't have an account";
  String get textSign => isSignUp ? " Sign In" : " Sign Up";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = context.watch<AuthProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Header
                AuthHeader(
                  title: title,
                  image: "assets/image/general_image/furnio logo.png",
                  sizeImage: size.height * 0.16,
                  spaceBetweenImagesAndText: 10,
                ),
                HeightSpace1(space: 20),

                ///Inputs
                GeneralTextField(
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  textEditingController: auth.emailController,
                  hasError: auth.emailError != null,
                ),
                HeightSpace1(space: 15),
                GeneralTextField(
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: auth.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  obscureText: !auth.isPasswordVisible,
                  onSuffixTap: auth.togglePasswordVisibility,
                  textEditingController: auth.passwordController,
                  hasError: auth.passwordError != null,
                ),
                HeightSpace1(space: 8),

                /// Remember Box
                const RememberMeRow(),
                HeightSpace1(space: 10),

                /// Button
                GeneralButton(
                  text: buttonText,
                  onTap: () async {
                    final success =
                        isSignUp
                            ? await auth.signUpWithEmail()
                            : await auth.signInWithEmail();

                    if (!success) {
                      final message =
                          auth.firebaseError ??
                          auth.emailError ??
                          auth.passwordError ??
                          "Error";

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isSignUp
                              ? "Account created successfully"
                              : "Signed in successfully",
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );

                    /// SUCCESS
                    final service = AccountSetupService();
                    final hasProfile = await service.isProfileCompleted();
                    if (hasProfile) {
                      context.go('/mainLayout');
                    } else {
                      context.go('/fillProfile');
                    }
                  },
                ),
                HeightSpace1(space: 20),

                /// forgot the password ?
                isSignUp
                    ? SizedBox(height: 40)
                    : GestureDetector(
                      onTap: () async {
                        final exists = await auth.checkEmailExists();
                        if (!exists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(auth.emailError ?? 'Invalid email'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        context.push(
                          '/forgotPassword',
                          extra: auth.emailController.text.trim(),
                        );
                      },
                      child: GeneralText(
                        padding: EdgeInsets.only(
                          left: size.width * 0.03,
                          bottom: size.height * 0.03,
                        ),
                        text: 'forgot the password ?',
                        sizeText: size.width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                /// AuthDivider
                const AuthDivider(text: "or continue with"),
                HeightSpace1(space: 25),

                /// SocialIconsRow
                const SocialIconsRow(),
                HeightSpace1(space: 25),

                /// Text Sign
                AuthTextSign(
                  textAccount: textAccount,
                  textSign: textSign,
                  onTap: () {
                    auth.clear();
                    context.pushReplacement(
                      isSignUp ? '/auth?mode=signIn' : '/auth?mode=signUp',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
