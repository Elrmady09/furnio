import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/categories_product_detail_provider.dart';

class CategoriesProductDetailTitleSection extends StatelessWidget {
  const CategoriesProductDetailTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoriesProductDetailProvider>();
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GeneralText(
          text: provider.name,
          sizeText: size.width * 0.06,
          fontWeight: FontWeight.w700,
        ),
        IconButton(
          icon: Icon(
            provider.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.black,
          ),
          onPressed: provider.toggleFavorite,
        ),
      ],
    );
  }
}
