import 'package:flutter/material.dart';
import 'package:flutter_chat_ai/screen/chat_screen.dart';
import 'package:flutter_chat_ai/screen/landingscreen/onboarding.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyDPPm8rtUvS1GzLJyMdd7_mtk45C_jG1oI');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen (),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}

