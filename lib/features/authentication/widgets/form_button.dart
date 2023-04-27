import 'package:flutter/material.dart';
import 'package:woodtok/constants/sizes.dart';
import 'package:woodtok/utils.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    this.textCustomer = "Next",
  });

  final bool disabled;
  final String textCustomer;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Sizes.size5,
          ),
          color: disabled
              ? isDarkMode(context)
                  ? Colors.grey.shade800
                  : Colors.grey.shade300
              : Theme.of(context).primaryColor,
        ),
        duration: const Duration(milliseconds: 400),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 400),
          style: TextStyle(
            color: disabled
                ? isDarkMode(context)
                    ? Colors.white
                    : Colors.grey.shade400
                : Colors.white,
            fontSize: Sizes.size14,
            fontWeight: FontWeight.w600,
          ),
          child: Text(
            textCustomer,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
