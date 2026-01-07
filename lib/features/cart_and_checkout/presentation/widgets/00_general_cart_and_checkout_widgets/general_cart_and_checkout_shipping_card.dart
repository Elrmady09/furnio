import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/checkout_provider.dart';
import '../../../logic/shipping_selection_type.dart';
import '../03_promo_code_widgets/promo_code_icon.dart';

class GeneralCartAndCheckoutShippingCard extends StatelessWidget {
  final int index;
  final Map<String, String> data;
  final bool showPrice;

  final ShippingSelectionType selectionType;

  const GeneralCartAndCheckoutShippingCard({
    super.key,
    required this.index,
    required this.data,
    this.showPrice = false,

    required this.selectionType,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CheckoutProvider>();
    Size size = MediaQuery.of(context).size;

    final isSelectedPadding = selectionType == ShippingSelectionType.promoCode
          ? EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: 5)
          : EdgeInsets.all(size.width * 0.04);

    bool isSelected;

    if (selectionType == ShippingSelectionType.address) {
      isSelected = provider.selectedIndex == index;
    } else if (selectionType == ShippingSelectionType.shippingMethod) {
      isSelected = provider.selectedShippingIndex == index;
    } else {
      isSelected = provider.selectedPromoIndex == index;
    }

    return GestureDetector(
      onTap: () {
        if (selectionType == ShippingSelectionType.address) {
          provider.selectAddress(index);
        } else if (selectionType == ShippingSelectionType.shippingMethod) {
          provider.selectShipping(index);
        } else if (selectionType == ShippingSelectionType.promoCode){
          provider.selectPromoCode(index);
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: isSelectedPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if(selectionType == ShippingSelectionType.promoCode)...[
              PromoCodeIcon(),
            ]else...[
              CircleAvatar(
                radius: size.width * 0.06,
                backgroundColor: Colors.grey[300],
                child: Container(
                  width: size.width * 0.08,
                  height: size.width * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle
                  ),
                  child:Image.asset(data['icon']!,color: Colors.white,scale: size.width * 0.065,),
                ),
              ),
              WidthSpace(space: 0.03),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GeneralText(
                        text: data['title']!,
                        sizeText: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                      /// default
                      if (data['default'] == 'true')
                        Container(
                          margin: EdgeInsets.only(left: size.width * 0.02),
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.02,
                            vertical: size.height * 0.003,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GeneralText(
                            text: 'Default',
                            sizeText: size.width * 0.025,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
                  HeightSpace(space: 0.005),
                  GeneralText(
                    text: data['subtitle']!,
                    sizeText: size.width * 0.03,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            if(showPrice)...[
              GeneralText(
                text: '\$${data['price']}',
                sizeText: size.width * 0.045,
                fontWeight: FontWeight.w700,
              ),
              WidthSpace(space: 0.015),
            ],

            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
            ),
          ],
        ),
      ),
    );
  }
}
