import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jak_one_pay/app/app_theme.dart';

import 'app_pages.dart';
import 'i18n/translation_service.dart';

class JakOnePayApp extends StatelessWidget {
  const JakOnePayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialPageRoute,
      getPages: pageRoutes,
      unknownRoute: Get.currentRoute.isEmpty ? splashPage : null,
      theme: AppTheme.theme(context),
      locale: TranslationService.getSavedLocale(),
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
