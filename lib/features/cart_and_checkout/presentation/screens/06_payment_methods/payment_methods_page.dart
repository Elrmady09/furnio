import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:furnio/features/cart_and_checkout/data/04_payment_methods/payment_method_data.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/04_payment_methods_widgets/payment_methods_card.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).brightness == Brightness.light ? Colors.grey[200]  : null,
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Payment Methods',trailing: Icon(Icons.add),),
              HeightSpace1(space: 8),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:paymentMethodData.length,
                  itemBuilder: (_, index) {
                    return PaymentMethodsCard(
                      data: paymentMethodData[index],
                      index: index,

                    );
                  },
                ),
              ),
              HeightSpace1(space: 8),
              GeneralButton(
                onTap: (){
                  context.push('/cartAndCheckoutPin');

                },
                text: 'Confirm Payment'
              ),

            ],
          ),
        ),
      ),
    );
  }
}
