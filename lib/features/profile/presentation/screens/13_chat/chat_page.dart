import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/chat_provider.dart';
import '../../widgets/09_chat_widgets/chat_input_field.dart';
import '../../widgets/09_chat_widgets/chat_message_list.dart';



class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Customer Service'),
        ),
        body: Column(
          children: const [
            Expanded(child: ChatMessageList()),
            ChatInputField(),
          ],
        ),
      ),
    );
  }
}
