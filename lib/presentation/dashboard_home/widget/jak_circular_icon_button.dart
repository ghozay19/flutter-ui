import 'package:flutter/material.dart';

import '../../../app/app_theme.dart';

class JakCircularIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const JakCircularIconButton(
      {super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Material(
        elevation: 12,
        shape: const CircleBorder(),
        shadowColor: Colors.black,
        child: Ink(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryColor,
                AppTheme.primaryColor2,
                AppTheme.yellow,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              icon,
              color: AppTheme.whiteColor,
              height: 18,
              width: 18,
            ),
          ),
        ),
      ),
    );
  }
}
