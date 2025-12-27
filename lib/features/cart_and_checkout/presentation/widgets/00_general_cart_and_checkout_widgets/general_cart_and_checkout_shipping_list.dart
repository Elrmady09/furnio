import 'package:flutter/material.dart';
import '../../../logic/shipping_selection_type.dart';
import 'general_cart_and_checkout_shipping_card.dart';

class GeneralCartAndCheckoutShippingList extends StatelessWidget {
  const GeneralCartAndCheckoutShippingList({super.key, required this.data, this.showPrice = false, required this.selectionType, this.height, required this.dataLength, });
  final List <Map<String,String>> data;
  final bool showPrice;
  final ShippingSelectionType selectionType;
  final double? height;
  final int dataLength;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: height ?? size.height * 0.56,
      child: ListView.builder(
        itemCount:dataLength,
        itemBuilder: (_, index) {
          return GeneralCartAndCheckoutShippingCard(
            index: index,
            data:data[index],
            showPrice:showPrice,
            selectionType:selectionType,
          );
        },
      ),
    );
  }
}
