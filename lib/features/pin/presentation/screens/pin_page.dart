import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../../forgot_password/logic/forgot_password_provider.dart';
import '../../logic/pin_provider.dart';
import '../widgets/pin_input.dart';



class PinPage extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onComplete;
  final bool isForgotPasswordPage;

  const PinPage({
    super.key,
    required this.title,
    required this.description,
    required this.onComplete,
    this.isForgotPasswordPage = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PinProvider>();
    final forgotPasswordProvider = context.watch<ForgotPasswordProvider>();

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: GestureDetector(
        onTap: provider.unFocusAll,
        child: Scaffold(
          body: Padding(
            padding: AppPadding.pagePadding(context),
            child: Column(
              children: [
                GeneralHeader(title: title),
                HeightSpace1(space: 80),
                GeneralText(
                  textAlign: TextAlign.center,
                  text: description,
                  sizeText: size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
                HeightSpace1(space: 80),

                PinInput(),

                if(isForgotPasswordPage)...[

                  HeightSpace1(space: 80),
                  GeneralText(
                    text: 'Resend code in ${forgotPasswordProvider.seconds}s',
                    sizeText: size.width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ],

                Spacer(),

                GeneralButton(
                  text: 'Continue',
                  onTap: onComplete,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
