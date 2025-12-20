import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../../logic/home_provider.dart';
class HomeFilterTabs extends StatelessWidget {
  const HomeFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    Size size = MediaQuery.of(context).size;

    final filters = ['All','Sofa','Chair','Table','Kitchen','Lamp','Cupboard','Vase'];

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
        SizedBox(
          height: size.height * 0.045,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (_, index) {
              final selected = provider.selectedFilter == index;
              return GestureDetector(
                onTap: () => provider.changeFilter(index),
                child: Container(
                  margin: EdgeInsets.only(right: size.width * 0.02),
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  decoration: BoxDecoration(
                    color: selected ? Colors.black : Colors.grey[200],
                    borderRadius: BorderRadius.circular(size.width * 0.05),
                    border: selected ? null : Border.all(width: size.width * 0.004,color: Colors.black),
                  ),
                  child: Center(
                    child: GeneralText(
                      text: filters[index],
                      color: selected ? Colors.white : Colors.black,
                      sizeText: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
