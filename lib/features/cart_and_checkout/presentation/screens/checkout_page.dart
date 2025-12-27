import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/general_button.dart';
import '../../../../core/widgets/general_text.dart';
import '../../../../core/widgets/space.dart';
import '../widgets/02_ckeckout_widgets/checkout_order_list.dart';
import '../widgets/02_ckeckout_widgets/checkout_promo_code.dart';
import '../widgets/02_ckeckout_widgets/checkout_shipping_address.dart';
import '../widgets/02_ckeckout_widgets/checkout_shipping_type.dart';
import '../widgets/02_ckeckout_widgets/checkout_summary.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                GeneralHeader(title: 'Checkout'),
                HeightSpace(space: 0.03),
                /// Shipping Address
                CheckoutShippingAddress(),
                HeightSpace(space: 0.03),
                /// Order List
                CheckoutOrderList(),
                HeightSpace(space: 0.03),
                /// Choose Shipping
                GeneralText(
                  text: 'Choose Shipping',
                  sizeText: size.width * 0.045,
                  fontWeight: FontWeight.w700,
                ),
                HeightSpace(space: 0.02),
                CheckoutShippingType(),
                HeightSpace(space: 0.02),
                Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
                /// promo code
                GeneralText(
                  text: 'Promo Code',
                  sizeText: size.width * 0.045,
                  fontWeight: FontWeight.w700,
                ),
                HeightSpace(space: 0.02),
                CheckoutPromoCode(),
                HeightSpace(space: 0.03),
                /// Summary
                CheckoutSummary(),
                HeightSpace(space: 0.04),
                GeneralButton(
                text: 'Continue to Payment →',
                onTap: () {
                  context.push('/paymentMethods');
                },
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
