import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
