import 'package:flutter/material.dart';
import 'package:furnio/features/cart_and_checkout/presentation/widgets/01_cart_widgets/remove_item_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/cart_provider.dart';
import 'cart_quantity.dart';


class CartItemCard extends StatelessWidget {

  final Map<String, dynamic> item;
  final bool showActions;
  final VoidCallback? onDelete;

  const CartItemCard({
    super.key,
    required this.item,
    this.showActions = true,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Padding(
      padding: EdgeInsets.symmetric(vertical:size.width * 0.01),
      child: Container(
        padding: EdgeInsets.all(size.width * 0.04),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01,vertical: size.height * 0.02),
              width: size.width * 0.24,
              height: size.height * 0.14,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(size.width * 0.03),
              ),
              child: Image.asset(item['image'],)
            ),
            WidthSpace(space: 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GeneralText(
                          text: item['name'],
                          sizeText: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      if (showActions && onDelete != null)
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: onDelete,
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: size.width * 0.04,
                        width: size.width * 0.04,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: item['color'],
                        ),
                      ),
                      WidthSpace(space: 0.015),
                      GeneralText(
                        text: item['colorName'],
                        sizeText: size.width * 0.03,
                        color: Colors.grey,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralText(
                        text: '\$${item['price']}.00',
                        sizeText: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      if (showActions)
                        CartQuantity(
                          index: context.read<CartProvider>().items.indexOf(item),
                        )
                      else
                        Container(
                          padding: EdgeInsets.all(size.width * 0.025),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: GeneralText(
                            text: '${item['quantity']}',
                            sizeText: size.width * 0.035,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                    ],
                  )


                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
