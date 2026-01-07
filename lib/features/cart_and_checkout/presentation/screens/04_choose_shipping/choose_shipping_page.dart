import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/general_button.dart';
import '../../../../../core/widgets/general_header.dart';
import '../../../../../core/widgets/space.dart';
import '../../../data/02_choose_shipping/choose_shipping_data.dart';
import '../../../logic/shipping_selection_type.dart';
import '../../widgets/00_general_cart_and_checkout_widgets/general_cart_and_checkout_shipping_list.dart';

class ChooseShippingPage extends StatelessWidget {
  const ChooseShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.grey[100]  : null,
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              GeneralHeader(title: 'Choose Shipping '),
              HeightSpace(space: 0.03),
              GeneralCartAndCheckoutShippingList(data: chooseShipping,showPrice: true,selectionType: ShippingSelectionType.shippingMethod,dataLength:chooseShipping.length ,),
              Spacer(),
              GeneralButton(text: 'Apply',onTap: () => context.pop(context),),

            ],
          ),
        ),
      ),
    );
  }
}
