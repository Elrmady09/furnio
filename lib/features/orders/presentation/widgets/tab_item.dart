import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/general_text.dart';
import '../../logic/orders_provider.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.index, required this.title});
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrdersProvider>();
    Size size = MediaQuery.of(context).size;
    final bool isActive = provider.selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => provider.changeTab(index),
        child: GeneralText(
          textAlign: TextAlign.center,
          text: title,
          sizeText: size.width * 0.045,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
