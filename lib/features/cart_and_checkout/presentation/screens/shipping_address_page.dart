import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/features/cart_and_checkout/presentation/widgets/00_general_cart_and_checkout_widgets/general_cart_and_checkout_shipping_list.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/space.dart';
import '../../data/01_shipping_address/shipping_address_data.dart';
import '../../logic/shipping_selection_type.dart';



class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              GeneralHeader(title: 'Shipping Address '),
              HeightSpace(space: 0.03),
              GeneralCartAndCheckoutShippingList(data: shippingAddresses,selectionType: ShippingSelectionType.address,dataLength:shippingAddresses.length ,),
              GeneralButton(text: 'Add New Address',bgColor: Colors.grey,textColor: Colors.black,),
              Spacer(),
              GeneralButton(text: 'Apply',onTap: () => context.pop(context),),

            ],
          ),
        ),
      ),
    );
  }
}
