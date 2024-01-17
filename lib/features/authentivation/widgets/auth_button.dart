import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/features/authentivation/login_form_screen.dart';
import 'package:woodtok/features/authentivation/username_screen.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final String authPage;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.authPage,
  });

  void _onGoTap(BuildContext context) {
    switch (authPage) {
      case 'signup':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const UserNameScreen(),
          ),
        );
      case 'login':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginFormScreen(),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onGoTap(context),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(
            Sizes.size14,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
