import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/orders_provider.dart';
import 'order_card.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersProvider = context.watch<OrdersProvider>();

    return Expanded(
      child: ListView.builder(
        itemCount: ordersProvider.filteredOrders.length,
        itemBuilder: (_, index) {
          return OrderCard(
            item:ordersProvider.filteredOrders[index],

          );
        },
      ),
    );
  }
}
