import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:provider/provider.dart';
import '../widgets/01_cart_widgets/cart_bottom_bar.dart';
import '../widgets/01_cart_widgets/cart_header.dart';
import '../../logic/cart_provider.dart';
import '../widgets/01_cart_widgets/cart_item_card.dart';
import '../widgets/01_cart_widgets/remove_item_bottom_sheet.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = context.watch<CartProvider>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            CartHeader(),
            Expanded(
              child: Padding(
                padding: AppPadding.pagePadding(context),
                child: ListView.builder(
                  itemCount: provider.items.length,
                  itemBuilder: (context, index) {
                    return CartItemCard(
                        item: provider.items[index],
                        onDelete: () {
                          showRemoveBottomSheet(context, size, provider.items[index]);
                        },
                    );
                  },
                ),
              ),
            ),
            CartBottomBar(),
          ],
        ),
      ),
    );
  }
}
