import 'package:flutter/material.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/widgets/form_button.dart';
import 'package:woodtok/features/tab_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
      // 오른쪽
    } else {
      setState(() {
        _direction = Direction.left;
      });
      // 왼쪽
    }
  }

  void _onPenEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onSubmit() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPenEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: SafeArea(
            child: AnimatedCrossFade(
              firstChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v52,
                  Text(
                    'Watch various videos',
                    style: TextStyle(
                      fontSize: Sizes.size40 - Sizes.size6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              secondChild: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v52,
                  Text(
                    'Follow the rules',
                    style: TextStyle(
                      fontSize: Sizes.size40 - Sizes.size6,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    'Take care of one another, Please.',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showingPage == Page.first ? 0 : 1,
            child: GestureDetector(
              onTap: _onSubmit,
              child: const FormButton(
                disabled: false,
                type: 'Enter the app!',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
