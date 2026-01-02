import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/space.dart';
import '../../../logic/chat_provider.dart';


class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChatProvider>();
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: provider.messageController,
              decoration: InputDecoration(
                hintText: 'Message...',
                contentPadding: EdgeInsets.all(size.width * 0.04),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(size.width * 0.04),
                ),
              ),
            ),
          ),
          WidthSpace(space: 0.03),
          GestureDetector(
            onTap: provider.sendMessage,
            child: CircleAvatar(
              radius: size.width * 0.06,
              backgroundColor: Colors.black,
              child: const Icon(Icons.send_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
