import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';

class PriceRangeBubble extends StatelessWidget {
  const PriceRangeBubble({super.key, required this.value, required this.left});
  final double value;
  final double left;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      left: left,
      top: size.height * 0.05,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.025,
          vertical: size.height * 0.005,
        ),
        child: GeneralText(
          text: '\$${value.toInt()}',
          color: Colors.black,
          sizeText: size.width * 0.035,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
