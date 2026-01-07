import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/features/cart_and_checkout/presentation/widgets/00_general_cart_and_checkout_widgets/general_cart_and_checkout_shipping_list.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/space.dart';
import '../../../data/01_shipping_address/shipping_address_data.dart';
import '../../../logic/shipping_selection_type.dart';



class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;


    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.grey[100]  : null,
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Shipping Address '),
              HeightSpace1(space: 4),
              GeneralCartAndCheckoutShippingList(data: shippingAddresses,selectionType: ShippingSelectionType.address,dataLength:shippingAddresses.length ,),
              HeightSpace1(space: 20),
              GeneralButton(text: 'Add New Address',bgColor: theme.onPrimary,textColor: theme.primary,),
              HeightSpace1(space: 15),
              GeneralButton(text: 'Apply',onTap: () => context.pop(context),),

            ],
          ),
        ),
      ),
    );
  }
}
