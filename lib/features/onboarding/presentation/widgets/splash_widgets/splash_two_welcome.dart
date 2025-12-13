import 'package:flutter/material.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';

class SplashTwoWelcome extends StatelessWidget {
  const SplashTwoWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07,),
      width: size.width,
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// مرحباً + ايقونة
          Row(
            children: [
              GeneralText(
                text: "Welcome to",
                sizeText: size.width * 0.09,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              WidthSpace(space: 0.1),
              Icon(
                Icons.waving_hand,
                size: size.width * 0.08,
                color: Colors.white,
              ),


            ],
          ),


          GeneralText(
            text: "Furnio",
            sizeText: size.width * 0.25,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),


          GeneralText(
            text: "the best furniture e-commerce app of the\ncentury for your daily needs!",
            sizeText: size.width * 0.045,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
