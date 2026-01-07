import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../widgets/02_ckeckout_widgets/checkout_order_list.dart';
import '../../widgets/02_ckeckout_widgets/checkout_promo_code.dart';
import '../../widgets/02_ckeckout_widgets/checkout_shipping_address.dart';
import '../../widgets/02_ckeckout_widgets/checkout_shipping_type.dart';
import '../../widgets/02_ckeckout_widgets/checkout_summary.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).brightness == Brightness.light ? Colors.grey[200]  : null,
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                GeneralHeader(title: 'Checkout'),
                HeightSpace1(space: 5),
                /// Shipping Address
                CheckoutShippingAddress(),
                /// Order List
                CheckoutOrderList(),
                HeightSpace1(space: 15),
                /// Choose Shipping
                GeneralText(
                  text: 'Choose Shipping',
                  sizeText: size.width * 0.045,
                  fontWeight: FontWeight.w700,
                ),
                HeightSpace1(space: 10),
                CheckoutShippingType(),
                HeightSpace1(space: 10),
                Divider(thickness: size.width * 0.005,color: Colors.grey[300],),
                HeightSpace1(space: 5),
                /// promo code
                GeneralText(
                  text: 'Promo Code',
                  sizeText: size.width * 0.045,
                  fontWeight: FontWeight.w700,
                ),
                HeightSpace1(space: 10),
                CheckoutPromoCode(),
                HeightSpace1(space: 15),
                /// Summary
                CheckoutSummary(),
                HeightSpace1(space: 25),
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
