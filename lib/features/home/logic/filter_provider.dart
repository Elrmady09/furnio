import 'package:flutter/material.dart';

class SortAndFilterProvider extends ChangeNotifier {
  RangeValues priceRange = const RangeValues(10, 1000);
  final double minPrice = 10;
  final double maxPrice = 1000;


  void changePrice(RangeValues values) {
    const double minDifference = 90;

    // لو الفرق أقل من 90 → نمنع التغيير
    if ((values.end - values.start) < minDifference) {
      return;
    }
    priceRange = values;
    notifyListeners();
  }
  /// تحويل السعر إلى نسبة مئوية (0 → 1)
  double get startPercent =>
      (priceRange.start - minPrice) / (maxPrice - minPrice);

  double get endPercent =>
      (priceRange.end - minPrice) / (maxPrice - minPrice);

  /// for Sort Tap
  int selectedSort = 0;
  void changeSort(int index) {
    selectedSort = index;
    notifyListeners();
  }
  /// for Rating Tap
  int selectedRating = 0;
  void changeRating(int index) {
    selectedRating = index;
    notifyListeners();
  }

  void reset() {
    selectedSort = 0;
    selectedRating = 0;
    priceRange = const RangeValues(10, 1000);
    notifyListeners();
  }

}