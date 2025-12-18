import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/space.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_text_sign.dart';
import '../widgets/social_button.dart';
import '../widgets/auth_divider.dart';


class LetsYouInPage extends StatelessWidget {
  const LetsYouInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.02),
          child: Column(
            children: [
              /// Header
              AuthHeader(
                title: "Let's you in",
                image: "assets/image/auth/auth image.png",
              ),

              HeightSpace(space: 0.04),

              /// SocialButton

              const SocialButton(
                icon: "assets/image/auth/facebook logo.png",
                text: "Continue with Facebook",
              ),

              const SocialButton(
                icon: "assets/image/auth/google logo.png",
                text: "Continue with Google",
              ),

              const SocialButton(
                icon: "assets/image/auth/apple logo.png",
                text: "Continue with Apple",
              ),

              /// AuthDivider

              HeightSpace(space: 0.03),
              const AuthDivider(text: "or",),


              /// Button Sign in
              Spacer(),
              GeneralButton(
                text: "Sign in with password",
                onTap:(){
                  context.push(
                    '/auth?mode=signIn',
                  );
                } ,
              ),
              HeightSpace(space: 0.03),

              /// Text Sign up
              AuthTextSign(
                onTap: (){
                  context.push(
                    '/auth?mode=signUp',
                  );
                },
                textAccount: "Don’t have an account? ",
                textSign: "Sign up",
              ),

            ],
          ),
        ),
      ),
    );
  }
}
