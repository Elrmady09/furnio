import 'package:flutter/material.dart';

import 'general_text.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({super.key, required this.text, this.onTap, this.bgColor, this.textColor});
  final String text;
  final VoidCallback? onTap;
  final Color? bgColor;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        height: size.height * 0.07,
        width: size.width,
        decoration: BoxDecoration(
          color: bgColor ?? colors.primary,
          borderRadius: BorderRadius.circular(size.width * 0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black54.withOpacity(0.2), // 🔹 لون الظل
              blurRadius: size.width * 0.0485, // 🔹 مدى نعومة الظل
              spreadRadius: size.width * 0.04, // 🔹 مدى انتشار الظل
              offset: Offset(0, 4), // 🔹 موقع الظل
            ),
          ],

        ),
        child: Center(
          child: GeneralText(
            text: text,
            sizeText: size.width * 0.05,
            color: textColor ?? colors.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
