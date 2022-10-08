import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = 'chat_screen';

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat screen'),
      ),
    );
  }
}
