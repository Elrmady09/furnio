import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/cart_provider.dart';


class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<CartProvider>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal:size.width * 0.03,vertical: size.height * 0.01),
      color: Colors.white,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralText(
                text: 'Total price',
                sizeText: size.width * 0.03,
                color: Colors.grey,
              ),
              HeightSpace(space: 0.005),
              GeneralText(
                text: '\$${provider.totalPrice.toStringAsFixed(2)}',
                sizeText: size.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),

          Expanded(
            child: GeneralButton(
              text: 'Checkout',
              onTap: () {
                context.push('/checkout');
              },
            ),
          ),
        ],
      ),
    );
  }
}
