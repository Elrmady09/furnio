import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AccountSetupService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;

  /// رفع الصورة (اختياري)
  Future<String?> uploadProfileImage(File? image) async {
    if (image == null) return null;

    final uid = _auth.currentUser!.uid;

    final ref = _storage
        .ref()
        .child('users')
        .child(uid)
        .child('profile.jpg');

    await ref.putFile(image);

    return await ref.getDownloadURL();
  }

  /// حفظ بيانات الحساب
  Future<void> saveUserProfile({
    required String fullName,
    required String nickName,
    required String date,
    required String email,
    required String phone,
    required String countryCode,
    required String gender,
    String? imageUrl,
  }) async {
    final uid = _auth.currentUser!.uid;

    await _firestore.collection('users').doc(uid).set({
      'fullName': fullName,
      'nickName': nickName,
      'dateOfBirth': date,
      'email': email,
      'phone': phone,
      'countryCode': countryCode,
      'gender': gender,
      'profileImage': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<bool> isProfileCompleted() async {
    final uid = _auth.currentUser!.uid;

    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .get();

    return doc.exists;
  }




}
