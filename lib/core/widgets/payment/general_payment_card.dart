import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:provider/provider.dart';

import '../../../features/cart_and_checkout/logic/checkout_provider.dart';


class GeneralPaymentCard extends StatelessWidget {
  const GeneralPaymentCard({super.key, required this.data, required this.index,this.inPaymentMethods = true});
  final Map<String, String> data;
  final int index;
  final bool inPaymentMethods;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CheckoutProvider>();
    Size size = MediaQuery.of(context).size;
    final bool isSelected = provider.selectedPaymentMethodsIndex == index;
    final bool isWallet = data['title'] == 'My Wallet';

    return GestureDetector(
      onTap: (){
        provider.selectPayment(index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.025),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: size.height * 0.025),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(size.width * 0.03),
        ),
        child: Row(
          children: [
            Image.asset(data['icon'] ?? '',scale: size.width * 0.04,),
            GeneralText(
              padding: EdgeInsets.only(left: size.width * 0.02),
              text: data['title'] ?? '',
              sizeText: size.width * 0.047,
              fontWeight: FontWeight.w700,
            ),
            if(isWallet && isSelected)
              GeneralText(
                padding: EdgeInsets.only(left: size.width * 0.3),
                text: '\$9379',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w700,
              ),
            Spacer(),
            if(inPaymentMethods)...[

              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
              ),
            ]else...[
              GeneralText(
                padding: EdgeInsets.only(left: size.width * 0.02),
                text: 'Connected',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w700,
              ),
            ]

          ],
        ),
      ),
    );
  }
}
