import 'package:flutter/material.dart';
import 'package:jak_one_pay/app/app_theme.dart';

class JakOneButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGradientOutlinedButton;

  const JakOneButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isGradientOutlinedButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: isGradientOutlinedButton
            ? const LinearGradient(
                colors: [
                  Color(0xFFFFA726),
                  Color(0xFFFF7043),
                ],
              )
            : const LinearGradient(colors: [
                AppTheme.yellow,
                AppTheme.yellow,
              ]),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isGradientOutlinedButton ? AppTheme.whiteColor : null,
          gradient: isGradientOutlinedButton
              ? null
              : const LinearGradient(colors: [
                  Color(0xFFFFA726),
                  Color(0xFFFF7043),
                ]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: BorderSide.none,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isGradientOutlinedButton
                      ? AppTheme.primaryColor
                      : AppTheme.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
