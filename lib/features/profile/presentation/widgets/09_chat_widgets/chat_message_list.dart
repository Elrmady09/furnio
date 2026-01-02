import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/chat_provider.dart';
import 'chat_message_bubble.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChatProvider>();
    Size size = MediaQuery.of(context).size;

    return StreamBuilder(
      stream: provider.messagesStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          padding: EdgeInsets.all(size.width * 0.04),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index];
            final isMe = data['senderId'] == provider.currentUserId;

            return ChatMessageBubble(
              message: data['message'],
              isMe: isMe,
              size: size,
            );
          },
        );
      },
    );
  }
}
