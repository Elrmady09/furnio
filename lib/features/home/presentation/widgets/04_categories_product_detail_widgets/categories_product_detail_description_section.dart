import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';

class CategoriesProductDetailDescriptionSection extends StatelessWidget {
  const CategoriesProductDetailDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          text: 'Description',
          sizeText: size.width * 0.05,
          fontWeight: FontWeight.w600,
        ),
        HeightSpace1(space: 4),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: size.width * 0.035,
              color: Colors.grey,
            ),
            children: [
              TextSpan(
                text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt'
              ),
              TextSpan(
                style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500) ,
                text: ' view more..',
              ),

            ]
          )
        ),
      ],
    );
  }
}
