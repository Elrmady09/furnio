import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:furnio/core/widgets/space.dart';

class ReceiptBarcodeItem extends StatelessWidget {
  const ReceiptBarcodeItem({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Image.asset(image,scale: size.width * 0.072,),
        WidthSpace(space: 0.04),
        GeneralText(
          text: title,
          sizeText: size.width * 0.045,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
