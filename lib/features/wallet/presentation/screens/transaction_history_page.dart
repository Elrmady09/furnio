import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_header.dart';

import '../widgets/00_general_wallet_widgets/general_wallet_transaction_card.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(
                title: 'Transaction History',
                trailing:Icon(Icons.search),
              ),
              GeneralWalletTransactionCard(showTitle: false,),
            ],
          ),
        ),
      ),
    );
  }
}
