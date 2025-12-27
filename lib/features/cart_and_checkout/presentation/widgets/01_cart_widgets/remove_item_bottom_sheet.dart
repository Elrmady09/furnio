import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../logic/cart_provider.dart';
import 'cart_item_card.dart';


void showRemoveBottomSheet(BuildContext context, Size size, Map<String, dynamic> item,) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (_) {
      return Padding(
        padding: EdgeInsets.all(size.width * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GeneralText(
              text: 'Remove From Cart?',
              sizeText: size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
            HeightSpace(space: 0.03,),
            CartItemCard(item: item, showActions: false,),
            Row(
              children: [
                Expanded(
                  child: GeneralButton(
                    text: 'Cancel',
                    bgColor: Colors.grey,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: size.width * 0.01),
                Expanded(
                  child: GeneralButton(
                    text: 'Yes, Remove',
                    onTap: () {
                      context.read<CartProvider>().removeItem(item);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
