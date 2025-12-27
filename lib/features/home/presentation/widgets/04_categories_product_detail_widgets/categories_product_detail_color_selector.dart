import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/categories_product_detail_provider.dart';

class CategoriesProductDetailColorSelector extends StatelessWidget {
  const CategoriesProductDetailColorSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoriesProductDetailProvider>();
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          text: 'Color',
          sizeText: size.width * 0.05,
          fontWeight: FontWeight.w700,
        ),
        HeightSpace(space: 0.015),
        Row(
          children: List.generate(
            provider.colors.length,
                (index) => GestureDetector(
              onTap: () => provider.changeColor(index),
              child: Container(
                margin: EdgeInsets.only(right: size.width * 0.03),
                width: size.width * 0.08,
                height: size.width * 0.08,
                decoration: BoxDecoration(
                  color: provider.colors[index]['color'],
                  shape: BoxShape.circle,
                ),
                child: provider.selectedColorIndex == index
                    ? const Icon(Icons.check, color: Colors.white)
                    : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
