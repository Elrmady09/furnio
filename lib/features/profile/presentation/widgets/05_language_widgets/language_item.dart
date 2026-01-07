import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GeneralText(
                text: title,
                sizeText: size.width * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              value ? Icons.radio_button_checked : Icons.radio_button_off,
            ),
          ],
        ),
      ),
    );
  }
}
