import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../logic/cart_provider.dart';

class CartQuantity extends StatelessWidget {
  final int index;

  const CartQuantity({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    final provider = context.watch<CartProvider>();

    return Container(
      height: size.height * 0.058,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove,color: Colors.black,),
            iconSize: size.width * 0.06,
            onPressed: () => provider.decreaseQuantity(index),
          ),
          GeneralText(
            text: provider.items[index]['quantity'].toString(),
            sizeText: size.width * 0.04,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.add,color: Colors.black,),
            iconSize: size.width * 0.06,
            onPressed: () => provider.increaseQuantity(index),
          ),
        ],
      ),
    );
  }
}
