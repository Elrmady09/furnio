import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';

class FAQItem extends StatelessWidget {
  const FAQItem({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ExpansionTile(
      title: GeneralText(
        text: title,
        sizeText: size.width * 0.04,
      ),
      children: [
        GeneralText(
          padding: EdgeInsets.only(left: size.width * 0.04,right: size.width * 0.04,bottom: size.height * 0.02),
          text: content,
          sizeText: size.width * 0.035,
          color: Colors.grey,
        ),
      ],
    );
  }
}
