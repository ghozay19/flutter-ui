import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jak_one_pay/presentation/home/page/home_page.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../app/app_theme.dart';
import '../../../app/const/assets.dart';
import '../../widget/jak_one_button.dart';
import '../get/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  static const routeName = '/onboarding-page';
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLanguageSwitcher(context),
                buildJakcardButton(context),
              ],
            ),
            const SizedBox(height: 40),
            buildCarousel(context),
            JakOneButton(
              text: 'Continue as a Guest',
              isGradientOutlinedButton: false,
              onPressed: () {
                Get.toNamed(HomePage.routeName);
              },
            ),
            const SizedBox(height: 16),
            JakOneButton(
              text: 'Continue as a Guest',
              onPressed: () {
                Get.toNamed(HomePage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLanguageSwitcher(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 40,
          width: 78,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Card(
            elevation: 5,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              height: 25,
              width: 78,
            ),
          ),
        ),
        Positioned(
          top: -2,
          left: 0,
          child: Obx(
            () => SizedBox(
              width: 78,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.switchLanguage(),
                    child: AnimatedOpacity(
                      opacity: controller.isEnglish.value ? 0.5 : 1.0,
                      duration: const Duration(milliseconds: 100),
                      child: SizedBox(
                        width: 30,
                        height: 50,
                        child: Image.asset(
                          indoIcon,
                          // width: 60,
                          // height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.switchLanguage(),
                    child: AnimatedOpacity(
                      opacity: controller.isEnglish.value ? 1.0 : 0.5,
                      duration: const Duration(milliseconds: 100),
                      child: SizedBox(
                        width: 30,
                        height: 50,
                        child: Image.asset(
                          engicon,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildJakcardButton(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.transparent,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 30,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Row(
            children: [
              Image.asset(
                creditCardIcon,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 8),
              Image.asset(
                jakcardIcon,
                height: 20,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCarousel(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Column(
          children: [
            CarouselSlider(
              items:
                  List.generate(controller.onBoardingCarousel.length, (index) {
                if (controller.onBoardingCarousel.isEmpty) {
                  return const SizedBox.shrink();
                }
                final data = controller.onBoardingCarousel[index];
                return Column(
                  children: [
                    Image.asset(
                      data['image'] ?? '',
                      height: 275,
                      width: 286,
                    ),
                    Text(
                      data['title']?.tr ?? '',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                    ),
                  ],
                );
              }),
              options: CarouselOptions(
                autoPlay: false,
                height: 320,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
                padEnds: false,
              ),
              carouselController: controller.cardCarouselController,
            ),
            Center(
              child: PageViewDotIndicator(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                alignment: Alignment.center,
                currentItem: controller.currentIndex.value,
                count: controller.onBoardingCarousel.length,
                boxShape: BoxShape.circle, // Change the shape to circular
                size: const Size(8, 8), // Make the dots smaller and circular
                unselectedSize: const Size(4, 4),
                unselectedColor: AppTheme.secondaryColor,
                selectedColor: AppTheme.primaryColor,
              ),
            )
          ],
        ),
      );
    });
  }
}
