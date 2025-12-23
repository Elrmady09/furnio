import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/home_provider.dart';

class GeneralHomeFilterTap extends StatelessWidget {
  const GeneralHomeFilterTap({super.key, required this.items, required this.selectedIndex, required this.onTap, this.showStar});
  final List<String> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final bool? showStar;


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    Size size = MediaQuery.of(context).size;
    //final filters = ['All','Sofa','Chair','Table','Kitchen','Lamp','Cupboard','Vase'];
    return SizedBox(
      height: size.height * 0.045,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (_, index) {
          final selected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: EdgeInsets.only(right: size.width * 0.02),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              decoration: BoxDecoration(
                color: selected ? Colors.black : Colors.grey[200],
                borderRadius: BorderRadius.circular(size.width * 0.05),
                border: selected ? null : Border.all(width: size.width * 0.004,color: Colors.black),
              ),
              child: Row(
                children: [
                  if(showStar ?? false)...[
                    Icon(
                      Icons.star,
                      size: size.width * 0.04,
                      color: selected ? Colors.white : Colors.black,
                    ),
                    WidthSpace(space: 0.02),
                  ],
                  Center(
                    child: GeneralText(
                      text: items[index],
                      color: selected ? Colors.white : Colors.black,
                      sizeText: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
