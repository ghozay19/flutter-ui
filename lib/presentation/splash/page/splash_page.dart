import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jak_one_pay/app/const/assets.dart';

import '../../../app/i18n/strings.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              splashColorImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: -5,
            left: 50,
            child: Image.asset(
              gradientTopLeftOne,
              width: 120,
            ),
          ),
          Positioned(
            top: -10,
            child: Image.asset(
              gradientTopLeftTwo,
              width: 130,
            ),
          ),
          Positioned(
            bottom: 60,
            right: 0,
            child: Image.asset(
              gradientBottomRightOne,
              width: 100,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              gradientBottomRightTwo,
              width: 80,
            ),
          ),
          Center(
            child: Image.asset(
              jakartaTouristPass,
              width: 286,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  ojkLpsImage,
                ),
                const SizedBox(height: 8),
                Text(
                  Strings.poweredByBankDKI.tr,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${DateTime.now().year}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
