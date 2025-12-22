import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier {
  /// Main Layout
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  String searchQuery = "";

  final Map<String, PageController> _controllers = {
    'home':PageController(),
    '25': PageController(),
    '15': PageController(),
    '30': PageController(),
    '20': PageController(),
  };

  PageController controller(String key) => _controllers[key]!;


  void setSearchQuery(String value) {
    searchQuery = value;
    notifyListeners();
  }


  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int selectedCategory = 0;
  int selectedFilter = 0;

  final List<bool> favorites = List.generate(8, (_) => false);

  void changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  void changeFilter(int index) {
    selectedFilter = index;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    favorites[index] = !favorites[index];
    notifyListeners();
  }


  @override
  void dispose() {

    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }


}