import 'package:flutter/material.dart';
import 'package:jak_one_pay/app/app_theme.dart';

class JakOneButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGradientOutlinedButton;
  final double? radiusCircular;

  const JakOneButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isGradientOutlinedButton = true,
    this.radiusCircular,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusCircular ?? 30),
        gradient: isGradientOutlinedButton
            ? const LinearGradient(
                colors: [
                  AppTheme.primaryColor2,
                  AppTheme.primaryColor,
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
              : const LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryColor2,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
          borderRadius: BorderRadius.circular(radiusCircular ?? 30),
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusCircular ?? 30),
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
