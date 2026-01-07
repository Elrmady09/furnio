import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';

import '../general_text.dart';

class GeneralHeaderWithLogo extends StatelessWidget {
  const GeneralHeaderWithLogo({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Image.asset('assets/image/splash/furnio icon.png',scale: size.width * 0.06,color: Theme.of(context).colorScheme.primary,),
        WidthSpace(space: 0.03),
        GeneralText(
          text: title,
          sizeText: size.width * 0.05,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        Icon(Icons.search, size: size.width * 0.06),
        WidthSpace(space: 0.03),
        Icon(Icons.more_vert, size: size.width * 0.06),
      ],
    );
  }
}
