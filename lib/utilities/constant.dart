import 'package:flutter/material.dart';

class AppColors {
  static const primary = Colors.black;
  static const textColor = Colors.white;
  static const checkColor = Color.fromARGB(255, 235, 235, 235);
  static const secondary = Color.fromARGB(255, 248, 240, 169);
  static const Color primaryColor = Color(0xFF1C4A5A);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color TextColor = Color(0xFF333333);
  static const Color accentColor = Color(0xFF0E313E);
  static const Color accentColor2 = Color.fromARGB(255, 72, 72, 72);
}


class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double fontSize;

  const AppElevatedButton({
    super.key, 
    required this.text,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = AppColors.textColor,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: fontSize),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: const Color.fromARGB(255, 182, 175, 118)
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: textColor)),
    );
  }
}

class TextStyles {

  static const TextStyle heading1 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle Hheading1 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static const TextStyle heading5 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.normal,
    color: Color.fromARGB(255, 181, 181, 181),
  );
  static const TextStyle heading3 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  static const TextStyle heading4 = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  static const TextStyle captionText = TextStyle(
    fontSize: 14.0,
    color: Colors.grey,
  );
  static const TextStyle captionText2 = TextStyle(
    fontSize: 14.0,
    color: Colors.green,
  );
  static const TextStyle captionText3 = TextStyle(
    fontSize: 14.0,
    color: Colors.black,
  );

}

class AppButtons {
  // Elevated Button Constants
  static Padding elevatedButton1({
    required VoidCallback onPressed,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 60.0,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          child: Row(
            children: [
              Text(text, style: const TextStyle(color: AppColors.backgroundColor),),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: AppColors.backgroundColor),
            ],
          ),
        ),
      ),
    );
  }
}