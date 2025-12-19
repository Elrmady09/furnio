import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/general_header.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/forgot_password_provider.dart';
import '../../logic/pin_code_provider.dart';
import '../widgets/contact_option_item.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key, required this.email});
  final String email;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ForgotPasswordProvider>().loadUserData(widget.email);
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<ForgotPasswordProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:size.width * 0.05,vertical: size.height * 0.02),
          child: Column(
            children: [
              ///Header
              GeneralHeader(title: 'Forgot Password'),
              HeightSpace(space: 0.02),

              /// Image
              Image.asset(
                'assets/image/forgot_password/forgot_password.png',
                height: size.height * 0.28,
              ),
              HeightSpace(space: 0.03),

              /// Text
              GeneralText(
                text:
                'Select which contact details should we use to reset your password',
                sizeText: size.width * 0.04,
                textAlign: TextAlign.center,
              ),
              HeightSpace(space: 0.03),

              /// Option
              ContactOptionItem(
                selected: provider.selectedOption == 0,
                title: 'via SMS',
                subtitle: provider.maskedPhone,
                icon: Icons.sms,
                onTap: () => provider.selectOption(0),
              ),
              HeightSpace(space: 0.02),
              ContactOptionItem(
                selected: provider.selectedOption == 1,
                title: 'via Email',
                subtitle: provider.maskedEmail,
                icon: Icons.email,
                onTap: () => provider.selectOption(1),
              ),
              const Spacer(),

              /// Button
              GeneralButton(
                text: 'Continue',
                onTap: () {
                  final forgotProvider = context.read<ForgotPasswordProvider>();
                  final pinProvider = context.read<PinCodeProvider>();
                  forgotProvider.startTimer();

                  if (forgotProvider.selectedOption == 0) {
                    // SMS
                    pinProvider.setData(
                      sms: true,
                      text: forgotProvider.maskedPhone ?? '',
                    );
                  } else {
                    // Email
                    pinProvider.setData(
                      sms: false,
                      text: forgotProvider.maskedEmail ?? '',
                    );
                  }

                  context.push('/pinCode');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
