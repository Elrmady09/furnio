import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../cart_and_checkout/logic/cart_provider.dart';
import '../../../logic/categories_product_detail_provider.dart';

class CategoriesProductDetailPriceSection extends StatelessWidget {
  const CategoriesProductDetailPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CategoriesProductDetailProvider>();
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralText(
              text: 'Total price',
              color: Colors.grey[600],
            ),
            GeneralText(
              text: '\$${provider.totalPrice.toStringAsFixed(2)}',
              sizeText: size.width * 0.055,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        WidthSpace(space: 0.1),
        Expanded(
          child: GeneralButton(
            text: 'Add to Cart',
            onTap: (){
              final cartProvider = context.read<CartProvider>();
              cartProvider.addToCart({
                'name': provider.name,
                'image': provider.image,
                'price': provider.price,
                'quantity': provider.quantity,
                'color': provider.selectedColor,
                'colorName': provider.selectedColorName,

              });
            },
          ),
        ),
      ],
    );
  }
}
