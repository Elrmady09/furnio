import 'package:flutter/material.dart';
import '../../../../core/widgets/general_text.dart';

class AccountHeader extends StatelessWidget {
  final String title;

  const AccountHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        GeneralText(
          text: title,
          sizeText: size.width * 0.05,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
