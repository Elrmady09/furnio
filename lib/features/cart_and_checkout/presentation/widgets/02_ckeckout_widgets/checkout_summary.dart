import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/cart_provider.dart';
import '../../../logic/checkout_provider.dart';

class CheckoutSummary extends StatelessWidget {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final checkout = context.watch<CheckoutProvider>();
    Size size = MediaQuery.of(context).size;

    final itemsTotal = cart.totalPrice;
    final shipping = checkout.shippingCost;
    final discount = checkout.getDiscount(itemsTotal);
    final total = checkout.getTotal(itemsTotal);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.025,vertical: size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: Column(
        children: [
          _row('Amount', cart.totalPrice, size),
          _row('Shipping', shipping, size),
          if (discount > 0)
            _row('Discount', discount, size, isDiscount: true),
          Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
          _row('Total', total, size, bold: true),
        ],
      ),
    );
  }

  Widget _row(String title, double value, Size size, {bool bold = false,bool isDiscount = false,}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.012),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GeneralText(text: title, sizeText: size.width * 0.038,fontWeight: FontWeight.w400,),
          GeneralText(
            text: '\$${value.toStringAsFixed(2)}',
            sizeText: size.width * 0.04,
            fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
