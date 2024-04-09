import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/storage_constant.dart';
import 'package:kayle/main.dart';

import 'en.dart';

class TranslationService extends Translations {
  static Locale getDeviceLocalLanguage() {
    if (preferences?.getBool(StorageConstants.deviceLanguage) != null &&
        preferences?.getBool(StorageConstants.deviceLanguage) == true) {
      String? languageCode =
          TranslationService.langs.contains(Get.deviceLocale!.languageCode)
              ? Get.deviceLocale!.languageCode
              : "en";
      preferences?.setString(StorageConstants.language, languageCode);
      preferences?.setBool(StorageConstants.deviceLanguage, true);
      return getLocaleLang(languageCode);
    } else {
      preferences?.setBool(StorageConstants.deviceLanguage, false);
      return getLocaleLang(
          preferences?.getString(StorageConstants.language) ?? "en");
    }
  }

  static getTranslateToLanguage() {
    if (preferences?.getBool(StorageConstants.translateToDeviceLanguage) !=
            null &&
        preferences?.getBool(StorageConstants.translateToDeviceLanguage) ==
            true) {
      String? languageCode =
          TranslationService.langs.contains(Get.deviceLocale?.languageCode)
              ? Get.deviceLocale?.languageCode
              : "en";
      preferences?.setString(
          StorageConstants.translateToLanguage, languageCode ?? "en");
      preferences?.setBool(StorageConstants.translateToDeviceLanguage, true);
    } else {
      preferences?.setBool(StorageConstants.translateToDeviceLanguage, false);
    }
  }

  // static Locale? get locale => getLocaleLang(preferences?.getString(StorageConstants.language) ?? "en");
  // static Locale fallbackLocale = getLocaleLang(preferences?.getString(StorageConstants.language) ?? "en");

  static Locale? get locale => getDeviceLocalLanguage();
  static Locale fallbackLocale =
      getLocaleLang(preferences?.getString(StorageConstants.language) ?? "en");

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'en',
  ];

  static final locales = [
    const Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    //final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(Locale(lang));
  }

  // Finds language in `langs` list and returns it as Locale
  /*Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }*/

  static Locale getLocaleLang(String lng) {
    Locale languageCode = const Locale('en', 'US');
    switch (lng) {
      case "en":
        languageCode = const Locale('en', 'US');
        break;
    }
    return languageCode;
  }
}
