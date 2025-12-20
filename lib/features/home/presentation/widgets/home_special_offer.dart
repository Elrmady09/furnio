import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/home_provider.dart';

class HomeSpecialOffer extends StatelessWidget {
  const HomeSpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final homeProvider = context.watch<HomeProvider>();

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
            GeneralText(
              text: 'See All',
              sizeText: size.width * 0.035,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        HeightSpace(space: 0.02),
        Container(
          height: size.height * 0.25,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(size.width * 0.05),
          ),
          child: Stack(
            children: [
              PageView.builder(
                controller: homeProvider.pageController,
                itemCount: 4,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(right: size.width * 0.03),
                    padding: EdgeInsets.symmetric(horizontal:size.width * 0.04,vertical: size.height * 0.01),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GeneralText(
                              text: '25%',
                              sizeText: size.width * 0.1,
                              fontWeight: FontWeight.w700,
                            ),
                            GeneralText(
                              text: 'Today’s Special!',
                              sizeText: size.width * 0.048,
                              fontWeight: FontWeight.w600,
                            ),
                            GeneralText(
                              padding: EdgeInsets.only(top: size.height * 0.01),
                              textAlign: TextAlign.start,
                              text: 'Get discount for every\norder, only valid for today',
                              sizeText: size.width * 0.03,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Image.asset('assets/image/home/offers.png',height: size.height * 0.18,),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                bottom: size.height * 0.015,
                left: size.width * 0.36,
                child: SmoothPageIndicator(
                  controller: homeProvider.pageController,
                  count: 4,
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: size.width * 0.08,
                      height: size.height * 0.014,
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(size.width * 0.1),
                    ),
                    dotDecoration: DotDecoration(
                      width: size.height * 0.014,
                      height: size.height * 0.014,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(size.width * 0.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
