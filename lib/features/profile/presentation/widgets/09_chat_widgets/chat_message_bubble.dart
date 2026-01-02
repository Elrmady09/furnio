import 'package:flutter/material.dart';
import '../../../../../core/widgets/general_text.dart';

class ChatMessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Size size;

  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.006),
        padding: EdgeInsets.all(size.width * 0.035),
        constraints: BoxConstraints(maxWidth: size.width * 0.7),
        decoration: BoxDecoration(
          color: isMe ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(size.width * 0.04),
        ),
        child: GeneralText(
          text: message,
          color: isMe ? Colors.white : Colors.black,
          sizeText: size.width * 0.04,
        ),
      ),
    );
  }
}
