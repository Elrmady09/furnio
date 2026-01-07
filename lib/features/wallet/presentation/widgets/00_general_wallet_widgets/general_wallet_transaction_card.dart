import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_format.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/general_text.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/wallet_provider.dart';
import '../01_wallet_widgets/transaction_item.dart';

class GeneralWalletTransactionCard extends StatelessWidget {
  const GeneralWalletTransactionCard({super.key,this.showTitle = true});
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WalletProvider>();
    Size size = MediaQuery.of(context).size;


    return Expanded(
      child: Column(
        children: [
          if(showTitle)...[
            Row(
              children: [
                GeneralText(
                  text: 'Transaction History',
                  sizeText: size.width * 0.045,
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.push('/transactionHistory'),
                  child: GeneralText(
                    text: 'See All',
                    sizeText: size.width * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            HeightSpace1(space: 14),
          ],
          Expanded(
            child: ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (_, index) {

                return TransactionItem(
                  image: provider.transactions[index]['image'],
                  name: provider.transactions[index]['name'],
                  price: '\$${provider.transactions[index]['price']}',
                  date: AppFormat.formatDate(provider.transactions[index]['date']),
                  type: provider.transactions[index]['type'],
                  onTap: (){
                    context.read<WalletProvider>().selectTransaction(provider.transactions[index]);
                    context.push('/receipt');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
