import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../data/special_offers_data.dart';
import '00_general_home_widgets/general_home_special_offer.dart';

class HomeSpecialOffer extends StatelessWidget {
  const HomeSpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            GeneralText(
              text: 'Special Offers',
              sizeText: size.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            GestureDetector(
              onTap: ()=> context.push('/specialOffers'),
              child: GeneralText(
                text: 'See All',
                sizeText: size.width * 0.035,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        HeightSpace(space: 0.02),
        GeneralHomeSpecialOffer(controllerKey: 'home', offers: itemSpecialOffers_25,),
      ],
    );
  }
}
