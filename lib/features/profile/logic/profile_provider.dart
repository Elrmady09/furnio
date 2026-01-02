import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProfileProvider extends ChangeNotifier {

  /// logout
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    // الرجوع لشاشة تسجيل الدخول
    if (context.mounted) {
      context.go('/auth'); // أو أي Route خاص بك
    }
  }

  /// Add New Address
  final TextEditingController addressController = TextEditingController();
  final TextEditingController addressDetailsController = TextEditingController();

  final List<Map<String, String>> _shippingAddresses = [
    {
      'icon' : 'assets/image/cart_and_checkout/location.png',
      'title': 'Home',
      'subtitle': '61480 Sunbrook Park, PC 5679',
      'default': 'true',
    },
    {
      'icon' : 'assets/image/cart_and_checkout/location.png',
      'title': 'Office',
      'subtitle': '6993 Meadow Valley Terra, PC 3637',
    },
    {
      'icon' : 'assets/image/cart_and_checkout/location.png',
      'title': 'Apartment',
      'subtitle': '21833 Clyde Gallagher, PC 4662',
    },
    {
      'icon' : 'assets/image/cart_and_checkout/location.png',
      'title': "Parent's House",
      'subtitle': '5259 Blue Bill Park, PC 4627',
    },
  ];

  List<Map<String, String>> get shippingAddresses => _shippingAddresses;

  void addNewAddress({
    required String title,
    required String subtitle,
  }) {
    shippingAddresses.add({
      'icon': 'assets/image/cart_and_checkout/location.png',
      'title': title,
      'subtitle': subtitle,
    });

    notifyListeners();
  }

  void clearAddress (){
    addressController.text = '';
    addressDetailsController.text = '';
  }





  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
  /// Security Page
  bool rememberMe = true;
  bool faceId = false;
  bool biometric = true;

  void toggleRemember(bool v) {
    rememberMe = v;
    notifyListeners();
  }

  void toggleFaceId(bool v) {
    faceId = v;
    notifyListeners();
  }

  void toggleBiometric(bool v) {
    biometric = v;
    notifyListeners();
  }
  /// Language page
  String selectedLanguage = 'English (US)';

  void changeLanguage(String value) {
    selectedLanguage = value;
    notifyListeners();
  }

  /// Invite Friends
  /// قائمة الدعوات: مفتاح الاسم → حالة الدعوة
  final Map<String, bool> _invitedStatus = {};

  /// تحقق إذا صديق معين تم دعوته
  bool isInvited(String name) {
    return _invitedStatus[name] ?? false;
  }

  /// تغيير حالة الدعوة
  void toggleInvite(String name) {
    _invitedStatus[name] = !(_invitedStatus[name] ?? false);
    notifyListeners();
  }

  /// Help Center Page
  int selectedTab = 0; // 0 FAQ - 1 Contact
  int selectedCategory = 0;
  String searchText = '';


  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }

  void changeCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }



  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  bool isSearching = false;

  void openSearch() {
    isSearching = true;
    searchFocusNode.requestFocus();
    notifyListeners();
  }

  void changeSearch(String value) {
    searchText = value;
    notifyListeners();
  }
  void unFocus(){
    searchFocusNode.unfocus();
    isSearching = false;
    notifyListeners();
  }


}
