import 'package:flutter/material.dart';

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget icon(String path) => Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07,vertical:15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.03),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Image.asset(path, height: size.width * 0.06),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        icon("assets/image/auth/facebook logo.png"),
        icon("assets/image/auth/google logo.png"),
        icon("assets/image/auth/apple logo.png"),
      ],
    );
  }
}
