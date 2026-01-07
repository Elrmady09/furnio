import 'package:flutter/material.dart';
import 'package:furnio/core/constants/app_padding.dart';
import 'package:furnio/core/widgets/header/general_header_with_logo.dart';
import 'package:furnio/core/widgets/space.dart';
import '../../widgets/01_order_widgets/orders_tabs.dart';
import '../../widgets/01_order_widgets/orders_list.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Theme.of(context).brightness == Brightness.light ? Colors.grey[200]  : null,
        body: Padding(
          padding: AppPadding.pagePadding(context),
          child: Column(
            children: [
              GeneralHeaderWithLogo(title: 'My Orders'),
              HeightSpace1(space: 10),
              OrdersTabs(),
              OrdersList(),
            ],
          ),
        ),
      ),
    );
  }
}
