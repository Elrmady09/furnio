import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/home_provider.dart';

class GeneralHomeFilterTap extends StatelessWidget {
  const GeneralHomeFilterTap({super.key});


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    Size size = MediaQuery.of(context).size;
    final filters = ['All','Sofa','Chair','Table','Kitchen','Lamp','Cupboard','Vase'];
    return SizedBox(
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
    );
  }
}
