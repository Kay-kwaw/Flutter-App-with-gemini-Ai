import 'package:flutter/material.dart';
import 'package:flutter_chat_ai/utilities/constant.dart';

class ChatScreen extends StatefulWidget {
  static const String id = '/chat';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textColor),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
        ),
        title: const Text('Gemini Ai Chatbot', style: TextStyle(color: AppColors.textColor)),
        backgroundColor: Colors.black,
        elevation: 2.0,
      ),
      body: const Center(
        child: Text('How can I help you?', style: TextStyle(color: AppColors.textColor, fontSize: 24.0)),
      ),
    );
  }
}