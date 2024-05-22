import 'package:flutter/material.dart';
import 'package:flutter_chat_ai/utilities/constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String id = '/splash_screen';

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Gemini Ai Chatbot',
              style: TextStyles.heading1,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/splash.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                ), 
              ]
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
            child: Text(
              'Reach Your\nArtificial Intelligence Goals',
              style: TextStyles.heading1,
              textAlign: TextAlign.start,
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 15.0, bottom: 60.0),
            child: Text(
              "Call your friends and family for\nfree with Gemini Ai Chatbot.",
              style: TextStyles.heading5,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: AppButtons.elevatedButton1(
              onPressed: () {
                Navigator.pushNamed(context, '/chat');
              },
              text: 'Get Started',
            ),
          ),
        ],
      ),
    ),
  );
}
}
