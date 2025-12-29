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
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Alerts",
          ),
        ],
      );
    },
  );
}
