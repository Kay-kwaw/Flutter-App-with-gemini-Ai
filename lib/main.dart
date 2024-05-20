import 'package:flutter/material.dart';
import 'package:flutter_chat_ai/screen/chat_screen.dart';
import 'package:flutter_chat_ai/screen/landingscreen/onboarding.dart';

void main() {
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
        '/': (context) => const OnboardingScreen (),
        '/chat': (context) => const ChatScreen(),
      },
    );
  }
}

