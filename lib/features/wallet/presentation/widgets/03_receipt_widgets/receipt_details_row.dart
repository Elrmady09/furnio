import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_format.dart';
import 'package:furnio/features/wallet/presentation/widgets/03_receipt_widgets/receipt_row_data.dart';
import 'package:provider/provider.dart';

import '../../../logic/wallet_provider.dart';

class ReceiptDetailsRow extends StatelessWidget {
  const ReceiptDetailsRow({super.key});

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
          ReceiptRowData(title: 'Payment Methods', value: 'My E-Wallet',),
          ReceiptRowData(title: 'Date', value: AppFormat.formatDate(transaction!['date']),),
          ReceiptRowData(title: 'Transaction ID', value: 'SK1257854825',),
          ReceiptRowData(title: 'Status', value: '\$60',showPaid: true,),

        ],
      ),
    );
  }
}