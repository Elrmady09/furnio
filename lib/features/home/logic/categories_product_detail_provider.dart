import 'package:flutter/material.dart';
import 'package:furnio/features/home/data/models/reviews/reviews_model.dart';

class CategoriesProductDetailProvider extends ChangeNotifier {
  PageController pageController = PageController();

  /// Display Logic
  Map<String, dynamic>? _product;

  Map<String, dynamic>? get product => _product;

  void setProduct(Map<String, dynamic> product) {
    _product = product;
    quantity = 1;
    notifyListeners();
  }

  // getters نظيفة
  String get name => _product?['productName'] ?? '';
  String get image => _product?['image'] ?? '';
  String get sold => _product?['sold'] ?? '';
  String get rating => _product?['rating'] ?? '';
  String get price => _product?['price'] ?? '';
  Color get selectedColor => colors[selectedColorIndex]['color'];
  String get selectedColorName => colors[selectedColorIndex]['name'];
  List<ReviewsModel> get reviews => (_product?['reviews'] as List<ReviewsModel> );


  /// rating filter
  int selectedRating = -1; // -1 = All

  void changeRating(int rating) {
    selectedRating = rating;
    notifyListeners();
  }

  List<ReviewsModel> get filteredReviews {
    final allReviews = reviews;

    if (selectedRating == -1) {
      return allReviews;
    }

    return allReviews.where((review) {
      return review.rating.floor() == selectedRating;
    }).toList();
  }


  /// Favorite
  bool isFavorite = false;
  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  /// color
  int selectedColorIndex = 0;
  final List<Map<String, dynamic>> colors = [
    {'color': const Color(0xff8B5E3C), 'name': 'Brown'},
    {'color': const Color(0xff607D8B), 'name': 'Blue Grey'},
    {'color': const Color(0xff9C27B0), 'name': 'Purple'},
    {'color': const Color(0xff9E9E9E), 'name': 'Grey'},
    {'color': const Color(0xff3f51b3), 'name': 'Indigo'},
    {'color': const Color(0xff009789), 'name': 'Teal'},
  ];

  void changeColor(int index) {
    selectedColorIndex = index;
    notifyListeners();
  }

  /// Quantity
  int quantity = 1;
  void increaseQty() {
    quantity++;
    notifyListeners();
  }
  void decreaseQty() {
    if (quantity > 1) {
      quantity--;
      notifyListeners();
    }
  }
  // convert price from String to double
  double get priceDouble {
    return double.tryParse(price) ?? 0.0;
  }
  // Total Price
  double get totalPrice => priceDouble * quantity ;









}
