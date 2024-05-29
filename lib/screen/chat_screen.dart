import 'package:flutter/material.dart';
import 'package:flutter_chat_ai/screen/landingscreen/models/model.dart';
import 'package:flutter_chat_ai/utilities/constant.dart';
import 'package:flutter_gemini/flutter_gemini.dart' hide Content;
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

final gemini = Gemini.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _userInput = TextEditingController();
// Declare a constant for the API key used to authenticate requests to the generative model.
static const apiKey = "AIzaSyDPPm8rtUvS1GzLJyMdd7_mtk45C_jG1oI";

// Initialize a ScrollController to manage the scrolling of the chat interface.
final ScrollController _scrollController = ScrollController();

// Create an instance of the GenerativeModel with the specified model name and API key.
final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

// Create a list to store the messages exchanged between the user and the AI.
final List<Message> _messages = []; 

// Define an asynchronous function to handle sending messages.
Future<void> sendMessage() async {
  // Retrieve the user's input text from the input field.
  final message = _userInput.text;

  // Update the state to add the user's message to the list of messages.
  setState(() {
    _messages.add(Message(
      isUser: true,  // Indicate that this message is from the user.
      message: message,  // The actual text of the user's message.
      date: DateTime.now(),  // Timestamp for when the message was sent.
      const Icon(Icons.copy)  // Icon to display next to the message.
    ));
  });

  // Scroll to the bottom of the chat interface after adding the user's message.
  _scrollToBottom();

  // Prepare the content for the generative model using the user's message.
  final content = [Content.text(message)]; 
  // Generate a response from the generative model based on the user's message.
  final response = await model.generateContent(content);
  // Update the state to add the AI's response to the list of messages.
  setState(() {
    _messages.add(Message(
      isUser: false,  // Indicate that this message is from the AI.
      message: response.text ?? "",  // The actual text of the AI's response.
      date: DateTime.now(),  // Timestamp for when the response was received.
      const Icon(Icons.copy)  // Icon to display next to the message.
    ));
  });

  // Scroll to the bottom of the chat interface after adding the AI's response.
  _scrollToBottom();
}

 
 //The _scrollToBottom method is responsible for scrolling the ListView to the bottom whenever it is called
void _scrollToBottom() {
  // Schedule the scroll to happen after the current frame is rendered
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // Check if the ScrollController is attached to a ScrollView
    if (_scrollController.hasClients) {
      // Animate the scroll to the maximum scroll extent (bottom of the ListView)
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, // Scroll to the bottom
        duration: const Duration(milliseconds: 300), // Animation duration
        curve: Curves.easeOut, // Animation curve for a smooth deceleration
      );
    }
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
                  controller: _scrollController,
                  // reverse: true,
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
                          hintText: 'Type a message',
                          hintStyle: const TextStyle(color: AppColors.TextColor),
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