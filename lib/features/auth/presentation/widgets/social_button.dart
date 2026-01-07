import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import '../../../../core/widgets/general_text.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
  });

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.03),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, height: size.width * 0.06),
          WidthSpace(space: 0.03),
          GeneralText(
            text: text,
            sizeText: size.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
