import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/payment/general_payment_card.dart';
import '../../../../cart_and_checkout/data/04_payment_methods/payment_method_data.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Payment',trailing: Icon(Icons.list),),
              HeightSpace(space: 0.02),
              SizedBox(
                height:size.height * 0.75,
                child: ListView.builder(
                  itemCount:paymentMethodData.length - 1,
                  itemBuilder: (_, index) {
                    return GeneralPaymentCard(
                      inPaymentMethods: false,
                      data: paymentMethodData[index + 1],
                      index: index,

                    );
                  },
                ),
              ),
              Spacer(),
              GeneralButton(
                text: 'Add New Card',
                onTap: () => context.push('/addCard'),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
