import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';

class PrivacySection extends StatelessWidget {
  const PrivacySection({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralText(
            text: title,
            sizeText: size.width * 0.045,
            fontWeight: FontWeight.w600,
          ),
          HeightSpace1(space:5),
          GeneralText(
            text: content,
            sizeText: size.width * 0.035,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
