import 'package:flutter/material.dart';
import 'package:furnio/features/wallet/presentation/widgets/03_receipt_widgets/receipt_row_data.dart';
import 'package:provider/provider.dart';

import '../../../logic/wallet_provider.dart';


class ReceiptAmountPaid extends StatelessWidget {
  const ReceiptAmountPaid({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final transaction = context.watch<WalletProvider>().selectedTransaction;


    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.035,vertical: 15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: Column(
        children: [
          ReceiptRowData(title: 'Amount', value: '\$${transaction!['price']}',),
          ReceiptRowData(title: 'Promo', value: '\$-',),
          Divider(thickness: size.width * 0.005,color: Colors.grey[200],),
          ReceiptRowData(title: 'Total', value: '\$${transaction['price']}',),
        ],
      ),
    );
  }
}
