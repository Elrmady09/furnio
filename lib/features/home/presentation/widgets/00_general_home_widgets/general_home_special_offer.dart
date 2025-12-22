import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/home_provider.dart';

class GeneralHomeSpecialOffer extends StatelessWidget {
  const GeneralHomeSpecialOffer({super.key, required this.controllerKey, required this.offers});
  final String controllerKey;
  final List<Map<String, dynamic>> offers;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = context.watch<HomeProvider>().controller(controllerKey);
    return Container(
      height: size.height * 0.25,
      margin: EdgeInsets.only(bottom: size.height * 0.03),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: offers.length,
            itemBuilder: (_, index) {
              final offerProduct = offers[index];
              return Container(
                margin: EdgeInsets.only(right: size.width * 0.03),
                padding: EdgeInsets.symmetric(horizontal:size.width * 0.04,vertical: size.height * 0.01),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralText(
                          text: offerProduct['offers'],
                          sizeText: size.width * 0.1,
                          fontWeight: FontWeight.w700,
                        ),
                        GeneralText(
                          text: offerProduct['title'],
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
                    Image.asset(offerProduct['image'],height: size.height * 0.18,),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: size.height * 0.015,
            left: size.width * 0.36,
            child: SmoothPageIndicator(
              controller: controller,
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
    );
  }
}
