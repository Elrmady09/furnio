import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_second_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/wallet_provider.dart';


class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WalletProvider>();
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset('assets/image/wallet/bank cart.png',width: size.width,height: 220,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06,vertical: 4),
          child: Row(
            children: [
              GeneralText(
                text: 'Andrew Ainsley',
                color: Colors.white,
                sizeText: size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              Image.asset('assets/image/wallet/visa.png',scale: size.width * 0.018,color: Colors.white,),
              Image.asset('assets/image/general_image/mastercard.png',scale: size.width * 0.008,),
            ],
          ),
        ),
        Positioned(
          top: 75,
          left: size.width * 0.07,
          child: GeneralText(
            text: '**** **** **** 3629',
            color: Colors.white,
            sizeText: size.width * 0.05,
            fontWeight: FontWeight.w500,
          ),
        ),
        Positioned(
          top: 115,
          left: size.width * 0.07,
          child: GeneralText(
            text: 'Your balance',
            color: Colors.white,
            sizeText: size.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
        Positioned(
          bottom: 25,
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 0.48,
                  child: GeneralText(
                    text: '\$${provider.balance.toStringAsFixed(0)}',
                    color: Colors.white,
                    sizeText: size.width * 0.11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GeneralSecondButton(
                  onTap: () => context.push('/topUpWallet'),
                  showIcon: true,
                  title: 'Top Up',
                  bottomPadding: 0,
                  width: size.width * 0.3,
                  bgColor: Colors.white,
                  titleColor: Colors.black,
                ),
              ],
            ),
          ),
        )

      ],
    );
  }
}
