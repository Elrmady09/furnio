import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../cart_and_checkout/logic/shipping_selection_type.dart';
import '../../../../cart_and_checkout/presentation/widgets/00_general_cart_and_checkout_widgets/general_cart_and_checkout_shipping_list.dart';
import '../../../logic/profile_provider.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    Size size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Address'),
              GeneralCartAndCheckoutShippingList(
                height:size.height * 0.75 ,
                data: provider.shippingAddresses,
                selectionType: ShippingSelectionType.address,
                dataLength:provider.shippingAddresses.length ,
              ),
              Spacer(),
              GeneralButton(text: 'Add New Address',onTap: () => context.push('/addNewAddress'),),

            ],
          ),
        ),
      ),
    );
  }
}
