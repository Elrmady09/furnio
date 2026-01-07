import 'package:flutter/material.dart';
import 'package:furnio/features/orders/presentation/widgets/01_order_widgets/tab_item.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/space.dart';
import '../../../logic/orders_provider.dart';

class OrdersTabs extends StatelessWidget {
  const OrdersTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrdersProvider>();
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            TabItem(index: 0, title: 'Active',),
            TabItem(index: 1, title: 'Completed',),

          ],
        ),
        HeightSpace1(space: 10),
        Stack(
          children: [
            Container(
              height: 4,
              color: Colors.grey[300],
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: provider.selectedTab == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: size.width * 0.4475,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  color: Colors.black,
                ),

              ),
            ),
          ],
        ),
        HeightSpace1(space: 15),
      ],
    );
  }


}
