import 'package:flutter/material.dart';
import 'package:flutter_chat_ai/screen/landingscreen/models/model.dart';
import 'package:flutter_chat_ai/utilities/constant.dart';
import 'package:flutter_gemini/flutter_gemini.dart' hide Content;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

final gemini = Gemini.instance;
TextEditingController _controller = TextEditingController();

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _userInput = TextEditingController();
  static const apiKey = "AIzaSyDPPm8rtUvS1GzLJyMdd7_mtk45C_jG1oI";

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];

  Future<void> sendMessage() async {
    final message = _userInput.text;
    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now(), const Icon(Icons.copy) ));
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      _messages.add(Message(isUser: false, message: response.text ?? "", date: DateTime.now(), const Icon(Icons.copy)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Gemini Ai Chatbot'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _messages.clear();
              });
            },
            icon: const Icon(Icons.edit),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.checkColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                   Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              );
            }
          ),
        )
      ),
      drawer: Drawer(
        backgroundColor: AppColors.backgroundColor,
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
              ),
              child: Text(
                'Gemini Ai Chatbot',
                style: TextStyles.heading3,
              ),
            ),
          ],
        ),
        ),
      body: Stack(
        children: [
         Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),  
            ),
            if (_messages.isEmpty)
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Text(
                  'How may I help you?',
                  style: TextStyles.heading3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _userInput,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.checkColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Type a message',hintStyle: const TextStyle(color: AppColors.TextColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            sendMessage();
                            _userInput.clear();
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
        ],
      ),

    );
  }
}


