import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/account_setup_service.dart';

class AccountSetupProvider extends ChangeNotifier {
  // Controllers
  final fullNameController = TextEditingController();
  final nickNameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // FocusNodes

  final fullNameFocus = FocusNode();
  final nickNameFocus = FocusNode();
  final dateFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();



  bool dateFocused = false;
  bool emailFocused = false;

  // Error states

  String? fullNameError;
  String? nickNameError;
  String? dateError;
  String? emailError;
  String? phoneNumberError;




  int selectedIndex = 0;
  String selectedCountry = 'US';
  String selectedFlag = '';

  String selectedGender = 'Male';

  bool fingerprintActive = false;

  void changeCountry(String value) {
    selectedCountry = value;
    notifyListeners();
  }
  void changeFlag(String value) {
    selectedFlag = value;
    notifyListeners();
  }

  void changeGender(String? value) {
    if(value == null) return;
    selectedGender = value;
    notifyListeners();
  }

  void activateFingerprint() {
    fingerprintActive = true;
    notifyListeners();
  }

  AccountSetupProvider() {
    dateFocus.addListener(() {
      dateFocused = dateFocus.hasFocus;
      notifyListeners();
    });
    emailFocus.addListener(() {
      emailFocused = emailFocus.hasFocus;
      notifyListeners();
    });
  }

  /// =========================
  /// Validation
  /// =========================
  bool validateInputs() {

    fullNameError = null;
    nickNameError = null;
    dateError = null;
    emailError = null;
    phoneNumberError = null;



    bool ok = true;

    final fullName = fullNameController.text;
    final nickName = nickNameController.text;
    final date = dobController.text;
    final email = emailController.text.trim();
    final phoneNumber = phoneController.text;
    


    if(fullName.isEmpty){
      fullNameError = 'Name is required';
      ok = false;
    }
    if(nickName.isEmpty){
      nickNameError = 'Nick Name is required';
      ok = false;
    }

    if (email.isEmpty) {
      emailError = 'Email is required';
      ok = false;
    }
    else if (!email.endsWith('@gmail.com')) {
      emailError = 'Email must be a Gmail address';
      ok = false;
    }

    if(date.isEmpty){
      dateError = 'date is required';
      ok = false;
    }
    if(phoneNumber.isEmpty){
      phoneNumberError = 'phone Number is required';
      ok = false;
    }

    notifyListeners();
    return ok;
  }



  @override
  void dispose() {
    fullNameController.dispose();
    nickNameController.dispose();
    dobController.dispose();
    emailController.dispose();
    phoneController.dispose();

    fullNameFocus.dispose();
    nickNameFocus.dispose();
    dateFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();

    super.dispose();
  }

  final _service = AccountSetupService();
  File? profileImage;
  final ImagePicker _picker = ImagePicker();

  bool isLoading = false;

  Future<void> pickProfileImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      profileImage = File(image.path);
      notifyListeners();
    }
  }

  // void setProfileImage(File image) {
  //   profileImage = image;
  //   notifyListeners();
  // }

  Future<void> submitProfile() async {
    isLoading = true;
    notifyListeners();

    try {
      String? imageUrl;

      if (profileImage != null) {
        imageUrl = await _service.uploadProfileImage(profileImage);
      }

      await _service.saveUserProfile(
        fullName: fullNameController.text.trim(),
        nickName: nickNameController.text.trim(),
        date: dobController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        countryCode: selectedCountry,
        gender: selectedGender,
        imageUrl: imageUrl,
      );
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

















}
