import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.image, this.sizeImage, this.spaceBetweenImagesAndText,
  });

  final String title;
  final String image;
  final double? sizeImage;
  final double? spaceBetweenImagesAndText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Container(
            alignment: Alignment.centerLeft,
            child:const Icon(Icons.arrow_back),
          )
        ),


        HeightSpace(space: 0.01),

        Image.asset(
          image,
          height: sizeImage ?? size.height * 0.25,
        ),

        HeightSpace(space:spaceBetweenImagesAndText ?? 0.01),

        GeneralText(
          text: title,
          sizeText: size.width * 0.08,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
