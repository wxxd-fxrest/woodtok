import 'package:flutter/material.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/sign_up_screen.dart';

void main() {
  runApp(const WoodTokApp());
}

class WoodTokApp extends StatelessWidget {
  const WoodTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WoodTok',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20 - Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}
