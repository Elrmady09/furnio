import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

      // 2) صفحة الاحصائيات
      //StatisticsPage(),

      // 3) صفحة البطاقة
     // MyCardsPage(),

      // 4) صفحة الإشعارات
      //NotificationsPage(),
    ];
  }
}