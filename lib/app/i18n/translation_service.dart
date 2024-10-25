import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'locales/en.dart';
import 'locales/id.dart';

class TranslationService extends Translations {
  static final _box = GetStorage(); // GetStorage instance
  static const _key = 'selectedLanguage';

  // Get the saved locale from local storage or default to device locale
  static Locale getSavedLocale() {
    String? languageCode = _box.read(_key);
    if (languageCode != null) {
      return Locale(languageCode);
    } else {
      return Get.deviceLocale ?? const Locale('en', 'US');
    }
  }

  static void saveLocale(Locale locale) {
    _box.write(_key, locale.languageCode); // Save the selected language
  }

  static const fallbackLocale = Locale('id');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'id_ID': id,
      };
}
