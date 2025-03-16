import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/services/storage_service.dart';
import 'package:get/get.dart';

class LocalizationService {
  // default language
  static Locale defaultLanguage = supportedLanguages['tr']!;
  static Locale currentLanguage = supportedLanguages['tr']!;

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'tr': const Locale('tr', ''), // Türkçe
    'en': const Locale('en', ''), // İngilizce
    'da': const Locale('da', ''), // Danca
    'fi': const Locale('fi', ''), // Fince
    'fr': const Locale('fr', ''), // Fransızca
    'de': const Locale('de', ''), // Almanca
    'el': const Locale('el', ''), // Yunanca
    'ga': const Locale('ga', ''), // İrlandaca
    'it': const Locale('it', ''), // İtalyanca
    'nl': const Locale('nl', ''), // Hollandaca
    'pt': const Locale('pt', ''), // Portekizce
    'es': const Locale('es', ''), // İspanyolca
    'no': const Locale('no', ''), // Norveççe
    'bg': const Locale('bg', ''), // Bulgarca
    'cs': const Locale('cs', ''), // Çekçe
    'et': const Locale('et', ''), // Estonca
    'hu': const Locale('hu', ''), // Macarca
    'lv': const Locale('lv', ''), // Letonca
    'lt': const Locale('lt', ''), // Litvanca
    'mt': const Locale('mt', ''), // Maltaca
    'pl': const Locale('pl', ''), // Lehçe
    'ro': const Locale('ro', ''), // Romence
    'sl': const Locale('sl', ''), // Slovence
  };

  static setSupportedLanguages(List<Locale> locales) {
    for (var locale in locales) {
      supportedLanguages[locale.languageCode] = locale;
    }
  }

  // supported languages fonts family (must be in assets & pubspec yaml) or you can use google fonts
  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    'tr': const TextStyle(fontFamily: 'SFProText'),
    'en': const TextStyle(fontFamily: 'SFProText'),
    'da': const TextStyle(fontFamily: 'SFProText'),
    'fi': const TextStyle(fontFamily: 'SFProText'),
    'fr': const TextStyle(fontFamily: 'SFProText'),
    'de': const TextStyle(fontFamily: 'SFProText'),
    'el': const TextStyle(fontFamily: 'SFProText'),
    'ga': const TextStyle(fontFamily: 'SFProText'),
    'it': const TextStyle(fontFamily: 'SFProText'),
    'nl': const TextStyle(fontFamily: 'SFProText'),
    'pt': const TextStyle(fontFamily: 'SFProText'),
    'es': const TextStyle(fontFamily: 'SFProText'),
    'no': const TextStyle(fontFamily: 'SFProText'),
    'bg': const TextStyle(fontFamily: 'SFProText'),
    'cs': const TextStyle(fontFamily: 'SFProText'),
    'et': const TextStyle(fontFamily: 'SFProText'),
    'hu': const TextStyle(fontFamily: 'SFProText'),
    'lv': const TextStyle(fontFamily: 'SFProText'),
    'lt': const TextStyle(fontFamily: 'SFProText'),
    'mt': const TextStyle(fontFamily: 'SFProText'),
    'pl': const TextStyle(fontFamily: 'SFProText'),
    'ro': const TextStyle(fontFamily: 'SFProText'),
    'sl': const TextStyle(fontFamily: 'SFProText'),
  };

  /// check if the language is supported
  static isLanguageSupported(String languageCode) =>
      supportedLanguages.keys.contains(languageCode);

  /// update app language by code language for example (en,ar..etc)
  static Future<void> updateLanguage(String languageCode) async {
    // check if the language is supported
    if (!isLanguageSupported(languageCode)) return;
    // update current language in shared pref
    await StorageService.setCurrentLanguage(languageCode);
    await Get.updateLocale(supportedLanguages[languageCode]!);

    initLanguage();
  }

  bool isCurrentLanguageTurkish() {
    return StorageService.getCurrentLocal().languageCode == 'tr';
  }

  static initLanguage() {
    currentLanguage = StorageService.getCurrentLocal();
  }

  /// get current locale
  static Locale getCurrentLocal() => StorageService.getCurrentLocal();
}
