import 'package:flutter/material.dart';
import 'package:furnio/features/cart_and_checkout/presentation/widgets/01_cart_widgets/cart_item_card.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/cart_provider.dart';
class CheckoutOrderList extends StatelessWidget {
  const CheckoutOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GeneralText(
          text: 'Order List',
          sizeText: size.width * 0.045,
          fontWeight: FontWeight.w600,
        ),
        HeightSpace(space: 0.015),
        Column(
          children: List.generate(
            cartProvider.items.length,
                (index) => CartItemCard(item: cartProvider.items[index],showActions: false),
          ),
        ),
      ],
    );
  }
}
