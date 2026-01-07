import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/categories_product_detail_provider.dart';

class CategoriesProductDetailQuantitySelector extends StatelessWidget {
  const CategoriesProductDetailQuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<CategoriesProductDetailProvider>();

    return Row(
      children: [
        GeneralText(
          text: 'Quantity',
          sizeText: size.width * 0.05,
          fontWeight: FontWeight.w700,
        ),
        WidthSpace(space: 0.05),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(size.width * 0.05),
          ),
          child: Row(
            children: [
              IconButton(onPressed: provider.decreaseQty, icon: const Icon(Icons.remove),iconSize: size.width * 0.06,),
              GeneralText(text: provider.quantity.toString(),fontWeight: FontWeight.w700,sizeText: size.width * 0.04,),
              IconButton(onPressed: provider.increaseQty, icon: const Icon(Icons.add),iconSize: size.width * 0.06,),
            ],
          ),
        ),
      ],
    );
  }
}
