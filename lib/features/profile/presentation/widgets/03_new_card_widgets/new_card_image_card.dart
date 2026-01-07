import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';

import '../../../../../core/widgets/general_text.dart';



class NewCardImageCard extends StatelessWidget {
  const NewCardImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset('assets/image/wallet/bank cart.png'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06,vertical: 18),
          child: Row(
            children: [
              GeneralText(
                text: 'Mocard',
                color: Colors.white,
                sizeText: size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              Padding(
                padding:EdgeInsets.only(top:10 ),
                child: Image.asset('assets/image/profile/amazon.png',scale: size.width * 0.2,color: Colors.white,),
              ),

            ],
          ),
        ),
        Positioned(
          top: 75,
          left: size.width * 0.07,
          child: GeneralText(
            text: '****  ****  ****  ****',
            color: Colors.white,
            sizeText: size.width * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),
        Positioned(
          bottom: 22,
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Row(
              children: [
                GeneralText(
                  text: 'Card Holder name\n----- -----',
                  color: Colors.white,
                  sizeText: size.width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
                WidthSpace(space: 0.1),
                GeneralText(
                  text: 'Expiry date\n-----/-----',
                  color: Colors.white,
                  sizeText: size.width * 0.03,
                  fontWeight: FontWeight.w500,
                ),
                WidthSpace(space: 0.05),
                Image.asset('assets/image/general_image/mastercard.png',scale: size.width * 0.006,),


              ],
            ),
          ),
        )

      ],
    );
  }
}
