import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:go_router/go_router.dart';

import '../../../cart_and_checkout/data/04_payment_methods/payment_method_data.dart';
import '../../../cart_and_checkout/presentation/widgets/04_payment_methods_widgets/payment_methods_card.dart';

class TopUpWalletMethodPage extends StatelessWidget {
  const TopUpWalletMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(title: 'Top UP E-Wallet'),
              HeightSpace(space: 0.02),
              SizedBox(
                height:size.height * 0.5,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:paymentMethodData.length - 1,
                  itemBuilder: (_, index) {
                    return PaymentMethodsCard(
                      data: paymentMethodData[index + 1],
                      index: index,

                    );
                  },
                ),
              ),
              GeneralButton(
                showShadow: false,
                text: 'Add New Card',
                bgColor: Colors.grey[400],
              ),
              Spacer(),
              GeneralButton(
                onTap: ()=> context.push('/walletPIN'),
                text: 'Continue',
              ),


            ],
          ),
        ),
      ),
    );
  }
}
