import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';




class HomeProvider extends ChangeNotifier {

  /// Search
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool isSearching = false;
  final List<String> _recentSearches = [];

  List<String> get recentSearches => _recentSearches;

  HomeProvider() {
    searchFocusNode.addListener(() {
      if (!searchFocusNode.hasFocus) {
        closeSearch();
      }
    });
    initScrollController();
  }

  void openSearch() {
    isSearching = true;
    searchFocusNode.requestFocus();
    notifyListeners();
  }

  void closeSearch() {
    isSearching = false;
    notifyListeners();
  }

  void addSearch(String value) {
    if (value.isEmpty) return;

    _recentSearches.remove(value);
    _recentSearches.insert(0, value);

    if (_recentSearches.length > 10) {
      _recentSearches.removeLast();
    }


    notifyListeners();
  }

  void removeSearch(String value) {
    _recentSearches.remove(value);
    notifyListeners();
  }

  void clearAll() {
    _recentSearches.clear();
    notifyListeners();
  }

  void resetSearch() {
    searchController.clear();
    searchFocusNode.unfocus();
    isSearching = false;
    notifyListeners();
  }

  /// hiden search box

  bool showSearch = true;
  late final ScrollController scrollController;

  void initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!scrollController.hasClients) return;

    if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      hideSearchBar(); // عند التمرير لأسفل يخفي
    } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // يظهر فقط إذا وصلنا لأعلى الصفحة
      if (scrollController.position.pixels <= 0) {
        showSearchBar();
      }
    }
  }

  void hideSearchBar() {
    if (showSearch) {
      showSearch = false;
      notifyListeners();
    }
  }

  void showSearchBar() {
    if (!showSearch) {
      showSearch = true;
      notifyListeners();
    }
  }





  /// controllers for Special offers in home and Special offers page
  final Map<String, PageController> _controllers = {
    'home':PageController(),
    '25': PageController(),
    '15': PageController(),
    '30': PageController(),
    '20': PageController(),
  };
  PageController controller(String key) => _controllers[key]!;



   /// Main Layout
  /// changePage for Bottom Navigation Bar
  int get currentIndex => _currentIndex;
  int _currentIndex = 0;
  void changePage(int index) {
    _currentIndex = index;
    notifyListeners();
  }



  int selectedCategory = 0;
  void changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  /// for Filter Tap
  int selectedFilter = 0;
  void changeFilter(int index) {
    selectedFilter = index;
    notifyListeners();
  }

  /// for Favorite
  Map<String, bool> favorites = {};

  void toggleFavorite(String productId) {
    favorites[productId] = !(favorites[productId] ?? false);
    notifyListeners();
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }


  @override
  void dispose() {

    for (final controller in _controllers.values) {
      controller.dispose();
    }
    searchController.dispose();
    searchFocusNode.dispose();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }


}