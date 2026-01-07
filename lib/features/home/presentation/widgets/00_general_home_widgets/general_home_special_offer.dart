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
    final theme =Theme.of(context).colorScheme;
    return Container(
      height: 171,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: theme.secondaryContainer,
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
                padding: EdgeInsets.symmetric(horizontal:size.width * 0.04,vertical: 8),
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
                          padding: EdgeInsets.only(top: 8),
                          textAlign: TextAlign.start,
                          text: 'Get discount for every\norder, only valid for today',
                          sizeText: size.width * 0.03,
                          color: theme.onSurfaceVariant
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                        child: Image.asset(offerProduct['image'],height: size.height,)
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 12,
            left: size.width * 0.36,
            child: SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: size.width * 0.08,
                  height: 10,
                  color: theme.primary,
                  borderRadius: BorderRadius.circular(size.width * 0.1),
                ),
                dotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
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
