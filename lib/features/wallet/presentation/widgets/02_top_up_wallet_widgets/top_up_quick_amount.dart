import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../logic/wallet_provider.dart';

class TopUpQuickGrid extends StatelessWidget {
  const TopUpQuickGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final amounts = [10, 20, 50, 100, 200, 250, 500, 750, 1000];
    Size size = MediaQuery.of(context).size;

    return Wrap(
      spacing: size.width * 0.03,
      runSpacing: size.height * 0.02,
      children: amounts.map((amount) {
        return TopUpQuickAmount(amount: amount.toDouble());
      }).toList(),
    );
  }
}

class TopUpQuickAmount extends StatelessWidget {
  const TopUpQuickAmount({super.key, required this.amount});
  final double amount;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<WalletProvider>();
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => context.read<WalletProvider>().selectTopUpAmount(amount),
      child: Container(
        width: size.width * 0.25,
        height: size.height * 0.055,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(size.width * 0.05),
        ),
        child: GeneralText(
          text: '\$${amount.toStringAsFixed(0)}',
          sizeText: size.width * 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
