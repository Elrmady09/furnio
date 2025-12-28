import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/space.dart';
import '../widgets/orders_header.dart';
import '../widgets/orders_tabs.dart';
import '../widgets/orders_list.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              OrdersHeader(),
              HeightSpace(space: 0.015),
              OrdersTabs(),
              OrdersList(),
            ],
          ),
        ),
      ),
    );
  }
}
