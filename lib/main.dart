import 'package:flutter/material.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/sign_up_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:woodtok/features/tab_navigation/main_navigation_screen.dart';

void main() {
  runApp(const WoodTokApp());
}

class WoodTokApp extends StatelessWidget {
  const WoodTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WoodTok',
      // Cupertino Datepicker 의 언어를 한국어로 변경하려면 아래 코드를 추가
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ko', ''), // Korean, no country code
      ],
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
      home: const MainNavigationScreen(),
    );
  }
}
