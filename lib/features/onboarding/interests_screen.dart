import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/onboarding/widgets/interest_button.dart';
import 'package:woodtok/features/onboarding/widgets/tutorial_screen.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Text('Choose your interests'),
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
                left: Sizes.size24, right: Sizes.size24, bottom: Sizes.size16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                const Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v4,
                const Text(
                  'Get better video recommendations',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.black45,
                  ),
                ),
                Gaps.v24,
                Wrap(
                  runSpacing: 18,
                  spacing: 12,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest)
                  ],
                ),
                Gaps.v12,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        surfaceTintColor: Colors.grey.shade100,
        child: CupertinoButton(
          onPressed: _onNextTap,
          color: Theme.of(context).primaryColor,
          child: const Text('Next'),
        ),
      ),
    );
  }
}
