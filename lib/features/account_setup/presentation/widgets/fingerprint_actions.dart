import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/general_button.dart';
import '../screens/success_dialog.dart';

class FingerprintActions extends StatelessWidget {
  const FingerprintActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GeneralButton(
            text: 'Skip',
            bgColor: Colors.grey.shade400,
            textColor: Colors.black,
            onTap: () {
              context.go('/home');
            },
          ),
        ),
        Expanded(
          child: GeneralButton(
            text: 'Continue',
            onTap: () async{
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => SuccessDialog(),
              );
              await Future.delayed(const Duration(seconds: 5));

              if (context.mounted) {
                context.pop();
              }
              if (context.mounted) {
                context.go('/home');
              }
              ///context.mounted
              /// لو المستخدم خرج من الصفحة قبل انتهاء الـ 5 ثواني  Flutter سيمنعك من استخدام context  بدونها → Crash

            },
          ),
        ),
      ],
    );
  }
}
