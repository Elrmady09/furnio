import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general_text.dart';
import '../../logic/auth_provider.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<AuthProvider>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
         //side: BorderSide(width: size.width * 0.01),
          value: provider.rememberMe,
          onChanged: (_) => provider.toggleRememberMe(),
        ),
        GeneralText(text: "Remember me",fontWeight: FontWeight.w500,),
      ],
    );
  }
}
