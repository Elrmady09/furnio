import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/general_header.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/forgot_password_provider.dart';
import '../../logic/pin_code_provider.dart';
import '../widgets/pin_input_row.dart';


class PinCodePage extends StatelessWidget {
  const PinCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<ForgotPasswordProvider>();
    final pinCodeProvider = context.watch<PinCodeProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: size.height * 0.02),
          child: Column(
            children: [
              /// Header
              GeneralHeader(title: 'Forgot Password'),
              HeightSpace(space: 0.1),

              /// Text

              GeneralText(
                text: pinCodeProvider.isSms
                    ? 'Code has been send to ${pinCodeProvider.value}'
                    : 'Code has been send to ${pinCodeProvider.value}',
                fontWeight: FontWeight.w500,
                sizeText: size.width * 0.04,
              ),

              HeightSpace(space: 0.07),

              /// Code Input

              PinInputRow(),

              HeightSpace(space: 0.07),

              /// Count

              GeneralText(
                text: 'Resend code in ${provider.seconds}s',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w500,
              ),
              Spacer(),


              /// Button

              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: GeneralButton(
                  text: 'Verify',
                  onTap: () => context.push('/createNewPassword'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
