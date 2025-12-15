import 'package:flutter/material.dart';

class AuthTextSign extends StatelessWidget {
  const AuthTextSign({super.key, this.onTap, required this.textAccount, required this.textSign});
  final VoidCallback? onTap;
  final String textAccount;
  final String textSign;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
            style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: FontWeight.w500

            ),
            children: [
              TextSpan(
                  text: textAccount,
                  style: TextStyle(color: Colors.grey)
              ),
              TextSpan(
                  text: textSign,
              )
            ]
        ),
      ),
    );
  }
}
