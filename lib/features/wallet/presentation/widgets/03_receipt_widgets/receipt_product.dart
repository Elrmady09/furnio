import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/wallet_provider.dart';

class ReceiptProduct extends StatelessWidget {
  const ReceiptProduct({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final transaction = context.watch<WalletProvider>().selectedTransaction;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: size.height * 0.02),
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.015,vertical: size.height * 0.01),
            width: size.width * 0.15,
            height: size.width * 0.15,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle
            ),
            child: Image.asset(transaction!['image']),
          ),
          WidthSpace(space: 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralText(
                  text: transaction['name'],
                  sizeText: size.width * 0.04,
                  fontWeight: FontWeight.w600,
                ),
                GeneralText(
                  text: 'Qty = ${transaction['quantity']}',
                  sizeText: size.width * 0.03,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          GeneralText(
            padding: EdgeInsets.only(right: size.width * 0.02),
            text: transaction['colorName'],
            sizeText: size.width * 0.033,
            color: Colors.black54,
          ),
          CircleAvatar(
            radius: size.width * 0.02,
            backgroundColor: transaction['color'],
          )

        ],
      ),
    );
  }
}
