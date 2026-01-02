import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final String supportUid = 'DZaW5DUqyAUP3NhVLvqxyZ5ZetS2';

  final TextEditingController messageController = TextEditingController();

  String get currentUserId => FirebaseAuth.instance.currentUser!.uid;

  String get chatId {
    return currentUserId.hashCode <= supportUid.hashCode
        ? '$currentUserId-$supportUid'
        : '$supportUid-$currentUserId';
  }

  Stream<QuerySnapshot> get messagesStream {
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt')
        .snapshots();
  }

  Future<void> sendMessage() async {
    if (messageController.text.trim().isEmpty) return;

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'senderId': currentUserId,
      'receiverId': supportUid,
      'message': messageController.text.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    messageController.clear();
  }
}
