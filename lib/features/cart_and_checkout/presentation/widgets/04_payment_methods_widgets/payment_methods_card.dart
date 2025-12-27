import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:provider/provider.dart';

import '../../../logic/checkout_provider.dart';

class PaymentMethodsCard extends StatelessWidget {
  const PaymentMethodsCard({super.key, required this.data, required this.index});
  final Map<String, String> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CheckoutProvider>();
    Size size = MediaQuery.of(context).size;

    final bool isSelected = provider.selectedPaymentMethodsIndex == index;

    return GestureDetector(
      onTap: (){
          provider.selectPayment(index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.025),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: size.height * 0.025),
        decoration: BoxDecoration(
          color: Colors.white,
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
            if(index == 0 && provider.selectedPaymentMethodsIndex == index)
              GeneralText(
                padding: EdgeInsets.only(left: size.width * 0.3),
                text: '\$9379',
                sizeText: size.width * 0.04,
                fontWeight: FontWeight.w700,
              ),
            Spacer(),
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
