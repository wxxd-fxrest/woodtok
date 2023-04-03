import 'package:flutter/material.dart';
import 'package:woodtok/features/authentication/sign_up_screen.dart';

void main() {
  runApp(const WoodTok());
}

class WoodTok extends StatelessWidget {
  const WoodTok({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tik Tok Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A),
      ),
      home: const SignUpScreen(),
    );
  }
}
