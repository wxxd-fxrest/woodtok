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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
