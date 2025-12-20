import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/home_provider.dart';


Widget homeBottomNavigationBar(BuildContext context) {
  return Consumer<HomeProvider>(
    builder: (context, provider, child) {
      return BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) => provider.changePage(index),

        type: BottomNavigationBarType.fixed,
        elevation: 20,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Card",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),
        ],
      );
    },
  );
}
