import 'package:flutter/material.dart';

void main() {
  runApp(const WoodTokApp());
}

class WoodTokApp extends StatelessWidget {
  const WoodTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WoodTok',
      theme: ThemeData(primaryColor: const Color(0xFFE9435A)),
      home: Container(),
    );
  }
}
