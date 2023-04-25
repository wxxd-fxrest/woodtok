import 'package:flutter/material.dart';
import 'package:woodtok/constants/gaps.dart';
import 'package:woodtok/constants/sizes.dart';

class UserProfileFollow extends StatelessWidget {
  const UserProfileFollow({
    Key? key,
    required this.topText,
    required this.underText,
  }) : super(key: key);

  final String topText;
  final String underText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          topText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v5,
        Text(
          underText,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        )
      ],
    );
  }
}
