import 'package:flutter/material.dart';
import 'package:furnio/features/orders/presentation/screens/01_my_orders/my_orders_page.dart';
import 'package:provider/provider.dart';
import '../../../cart_and_checkout/presentation/screens/01_cart/cart_page.dart';
import '../../../profile/presentation/screens/01_profile/profile_page.dart';
import '../../../wallet/presentation/screens/01_my_wallet/my_wallet_page.dart';
import '../../logic/home_provider.dart';
import '../widgets/home_bottom_navigation_bar.dart';
import 'home_page.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F7FA),
        body: _buildPages()[provider.currentIndex],
        bottomNavigationBar: homeBottomNavigationBar(context),


      ),
    );
  }

  List<Widget>_buildPages(){
    return[
      // 1) الصفحة الرئيسية
      HomePage(),

      // 2) صفحة cart
      CartPage(),

      // 3) صفحة order
      MyOrdersPage(),

      // 4) صفحة Wallet
      MyWalletPage(),
      // 4) صفحة Profile
      ProfilePage(),
    ];
  }
}