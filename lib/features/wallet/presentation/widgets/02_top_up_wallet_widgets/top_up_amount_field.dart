import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/general_text.dart';
import 'package:provider/provider.dart';

import '../../../logic/wallet_provider.dart';

class TopUpAmountField extends StatelessWidget {
  const TopUpAmountField({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WalletProvider>();
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.09,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          GeneralText(
            padding: EdgeInsets.only(right: size.width * 0.01),
            text: '\$',
            sizeText: size.width * 0.06,
            fontWeight: FontWeight.w700,
          ),
          IntrinsicWidth(
            child: TextField(
              controller: provider.topUpController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: provider.updateTopUpFromInput,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: size.width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

