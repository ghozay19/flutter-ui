import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jak_one_pay/app/const/assets.dart';

import '../../../app/i18n/strings.dart';
import '../../../app/i18n/translation_service.dart';

class OnboardingController extends GetxController {
  var isEnglish = false.obs;
  var currentIndex = 0.obs;
  var onBoardingCarousel = [
    {
      'image': monas,
      'title': Strings.exploreJakartaWithTouristPass,
    },
    {
      'image': monas,
      'title': Strings.exploreJakartaWithTouristPass,
    },
    {
      'image': monas,
      'title': Strings.exploreJakartaWithTouristPass,
    },
  ];

  CarouselSliderController cardCarouselController = CarouselSliderController();

  @override
  void onInit() {
    super.onInit();

    isEnglish.value = Get.locale?.languageCode == 'en';
  }

  void switchLanguage() {
    if (isEnglish.value) {
      Get.updateLocale(const Locale('id'));
      TranslationService.saveLocale(const Locale('id'));
      isEnglish.value = false;
    } else {
      Get.updateLocale(const Locale('en'));
      TranslationService.saveLocale(const Locale('en'));
      isEnglish.value = true;
    }
  }
}
