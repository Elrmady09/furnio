import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/general_button.dart';
import 'package:furnio/core/widgets/general_header.dart';
import 'package:furnio/features/wallet/logic/wallet_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/space.dart';
import '../../widgets/02_top_up_wallet_widgets/top_up_amount_field.dart';
import '../../widgets/02_top_up_wallet_widgets/top_up_quick_amount.dart';

class TopUpWalletPage extends StatelessWidget {
  const TopUpWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WalletProvider>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeader(
                title: 'Top Up E-Wallet',
                onTap: (){
                  context.pop(context);
                  provider.clear();
                },
              ),
              HeightSpace1(space: 15),
              TopUpAmountField(),
              HeightSpace1(space: 30),

              TopUpQuickGrid(),
              Spacer(),

              
              GeneralButton(
                text: 'Continue',
                onTap: (){
                  context.push('/topUpWalletMethod');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
