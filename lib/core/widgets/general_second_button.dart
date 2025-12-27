import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';

class GeneralSecondButton extends StatelessWidget {
  const GeneralSecondButton({super.key, this.onTap, required this.title, this.bgColor, this.titleColor});
  final VoidCallback? onTap;
  final String title;
  final Color? bgColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:onTap,
      child: Container(
        width: size.width  * 0.5,
        margin: EdgeInsets.only(bottom: size.height * 0.01),
        padding: EdgeInsets.symmetric(vertical: size.height * 0.011,horizontal: size.width *0.04),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(size.width * 0.07),
        ),
        child: Center(
          child: GeneralText(
            text: title,
            fontWeight: FontWeight.w700,
            sizeText: size.width * 0.045,
            color: titleColor,


          ),
        ),
      ),
    );
  }
}
