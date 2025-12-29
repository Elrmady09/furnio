import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/header/general_header_with_logo.dart';
import '../../../../core/widgets/space.dart';
import '../widgets/00_general_wallet_widgets/general_wallet_transaction_card.dart';
import '../widgets/01_wallet_widgets/wallet_card.dart';


class MyWalletPage extends StatelessWidget {
  const MyWalletPage({super.key});

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GeneralHeaderWithLogo(title: 'My E-Wallet'),
              HeightSpace(space: 0.03),
              const WalletCard(),

              HeightSpace(space: 0.04),
              GeneralWalletTransactionCard(),
            ],
          ),
        ),
      ),
    );
  }
}
