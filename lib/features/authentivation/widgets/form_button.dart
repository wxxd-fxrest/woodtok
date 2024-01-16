import 'package:flutter/material.dart';
import 'package:woodtok/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    required this.type,
  });

  final bool disabled;
  final String type;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
        decoration: BoxDecoration(
          color:
              disabled ? Colors.grey.shade200 : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            Sizes.size4,
          ),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: disabled ? Colors.grey.shade500 : Colors.white,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            type,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
