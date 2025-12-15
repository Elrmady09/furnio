
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/inputs/general_textfield.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/sign_up_provider.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_divider.dart';
import '../widgets/auth_text_sign.dart';
import '../widgets/social_icons_row.dart';
import '../widgets/remember_me_row.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signUp = context.watch<SignUpProvider>();
    //final signUp = Provider.of<SignUpProvider>(context);


    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// Header
                AuthHeader(
                  title: "Create Your Account",
                  image: "assets/image/general_image/furnio logo.png",
                  sizeImage: size.height * 0.17,
                  spaceBetweenImagesAndText: 0.05,
                ),
                HeightSpace(space: 0.03),

                ///Inputs

                GeneralTextField(
                    hintText: "Email",
                  prefixIcon: Icons.email,
                  textEditingController: signUp.emailController,
                  hasError: signUp.emailError != null,
                ),
                HeightSpace(space: 0.02),
                GeneralTextField(
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.remove_red_eye,
                  //obscureText: true,
                  textEditingController: signUp.passwordController,
                  hasError: signUp.passwordError != null,
                ),
                HeightSpace(space: 0.01),

                /// Remember Box
                const RememberMeRow(),
                HeightSpace(space: 0.01),
                /// Button
                GeneralButton(
                  onTap: ()async{
                    final success = await signUp.signUpWithEmail();

                    /// Invalid input

                    if (!success) {
                      final message =
                          signUp.firebaseError ??
                              signUp.emailError ??
                              signUp.passwordError ??
                              "Error";

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message), backgroundColor: Colors.red),
                      );
                      return;
                    }

                    /// Registration success
                    ///
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account created successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );

                  },
                    text: "Sign up",
                ),
                HeightSpace(space: 0.05),
                /// AuthDivider
                const AuthDivider(text: "or continue with",),
                HeightSpace(space: 0.03),
                /// SocialIconsRow

                const SocialIconsRow(),

                HeightSpace(space: 0.03),
                /// Text Sign IN
                AuthTextSign(
                  onTap: (){},
                  textAccount: "Already have an account ",
                  textSign: "Sign in",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
