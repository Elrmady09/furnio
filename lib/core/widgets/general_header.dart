import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/general_text.dart';

class GeneralHeader extends StatelessWidget {
  final String title;

  const GeneralHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
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
