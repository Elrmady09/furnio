import 'package:flutter/material.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '00_general_home_widgets/general_home_filter_tap.dart';

class HomeFilterTabs extends StatelessWidget {
  const HomeFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            GeneralText(
              text: 'Most Popular',
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
        GeneralHomeFilterTap(),
      ],
    );
  }
}
