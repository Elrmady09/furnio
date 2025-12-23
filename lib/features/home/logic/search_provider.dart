
import 'package:flutter/cupertino.dart';

import '../data/favorite_data.dart';
import '../data/home_products_data.dart';

class SearchProvider extends ChangeNotifier {

  /// Results
  String _query = '';
  List<Map<String, dynamic>> _results = [];

  String get query => _query;
  List<Map<String, dynamic>> get results => _results;

  void search(String value) {
    _query = value.toLowerCase();

    final allProducts = [
      ...itemHomeProducts,
      ...itemFavoriteProducts,
      // أي Lists أخرى لاحقًا
    ];

    _results = allProducts.where((item) {
      final name =
          item['productName']?.toString().toLowerCase() ?? '';

      final type =
          item['type']?.toString().toLowerCase() ?? '';

      return name.contains(_query) || type.contains(_query);
    }).toList();

    notifyListeners();
  }

  /// Search
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();


  /// تهيئة البحث عند الدخول للصفحة
  void initSearch(String initialQuery) {
    _query = initialQuery;
    searchController.text = initialQuery;

    if (initialQuery.isNotEmpty) {
      search(initialQuery);
    }
  }




  void clear() {
    _query = '';
    _results = [];
    searchController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }


}