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
        leading: Builder(
          builder: (context) {
            return Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                icon: const Icon(Icons.menu, color: AppColors.textColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          }
        ),
        title: const Text('Gemini Ai Chatbot', style: TextStyle(color: AppColors.textColor)),
        backgroundColor: Colors.black,
        elevation: 2.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Text(
                'Gemini Ai Chatbot',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 24,
                ),
              ),
            ),
            
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('How can I help you?', style:TextStyles.heading4),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30.0, left: 10, right: 10),
            child: Textfield(),
            ),
          ],

        ),
        ),
    );
  }
}

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Type a message',
        hintStyle: const TextStyle(color: AppColors.accentColor2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(31, 39, 39, 39),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      ),
    );
  }
}