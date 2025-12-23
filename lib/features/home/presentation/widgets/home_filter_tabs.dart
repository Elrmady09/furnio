import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_lists.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/home_provider.dart';
import '00_general_home_widgets/general_home_filter_tap.dart';

class HomeFilterTabs extends StatelessWidget {
  const HomeFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
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
        GeneralHomeFilterTap(items: AppLists.filtersTaps, selectedIndex:provider.selectedFilter, onTap: provider.changeFilter,),
      ],
    );
  }
}
