import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/features/cart_and_checkout/data/03_promo_code/promo_code_data.dart';
import 'package:furnio/features/cart_and_checkout/presentation/widgets/00_general_cart_and_checkout_widgets/general_cart_and_checkout_shipping_list.dart';
import 'package:go_router/go_router.dart';
import '../../logic/shipping_selection_type.dart';

class PromoCodePage extends StatelessWidget {
  const PromoCodePage({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Add Promo',trailing: Icon(Icons.search),),
              GeneralCartAndCheckoutShippingList(data: promoCodeData, selectionType: ShippingSelectionType.promoCode,dataLength:promoCodeData.length,height: size.height * 0.74,),
              Spacer(),
              GeneralButton(text: 'Apply',onTap: ()=> context.pop(context),),
            ],
          ),
        ),
      ),
    );
  }
}
