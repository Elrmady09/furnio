import 'package:flutter/material.dart';
import '../../../../core/widgets/general_text.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        const Expanded(child: Divider(
          color: Colors.grey,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: GeneralText(text: text),
        ),
        const Expanded(child: Divider(
          color: Colors.grey,
        )),
      ],
    );
  }
}
