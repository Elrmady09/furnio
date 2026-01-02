
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../features/profile/logic/profile_provider.dart';
import '../general_text.dart';
import '../space.dart';

class GeneralTabItem extends StatelessWidget {
  final int index;
  final String title;

  const GeneralTabItem({
    super.key,
    required this.index,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    Size size = MediaQuery.of(context).size;

    final bool isActive = provider.selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => provider.changeTab(index),
        child: Column(
          children: [
            GeneralText(
              text: title,
              sizeText: size.width * 0.04,
              fontWeight: FontWeight.w700,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}


class GeneralAnimatedTabs extends StatelessWidget {
  const GeneralAnimatedTabs({super.key, required this.titleOne, required this.titleTwo, required this.indexOne, required this.indexTwo,});
  final String titleOne;
  final String titleTwo;
  final int indexOne;
  final int indexTwo;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    Size size = MediaQuery.of(context).size;


    return Column(
      children: [
        Row(
          children: [
            GeneralTabItem(index: indexOne, title: titleOne),
            GeneralTabItem(index: indexTwo, title: titleTwo),
          ],
        ),

        HeightSpace(space: 0.015),

        Stack(
          children: [
            Container(
              height: size.height * 0.003,
              color: Colors.grey[300],
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: provider.selectedTab == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: size.width * 0.45,
                height: size.height * 0.004,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),

        HeightSpace(space: 0.03),
      ],
    );
  }
}
