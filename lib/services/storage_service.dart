import 'dart:ui';

import 'package:flutter_getx_boilerplate/shared/translations/localization_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService extends GetxService {
  static StorageService get to => Get.find();

  // Storage keys
  static const String _tokenKey = 'token';
  static const String _deviceIdKey = 'deviceId';
  static const String _nstKey = 'nst';
  static const String _isFirstOpenKey = 'isFirstOpen';
  static const String _cartProductsKey = 'cartProducts';
  static const String _favoriteProductsKey = 'favoriteProducts';

  // Default values from Postman
  static const String _defaultDeviceId = '44b4d8cd-7a2d-4a5f-a0e2-798021f1e294';
  static const String _defaultNst =
      'eyJhbGciOiJIUzUxMiJ9.eyJOU1RfS0VZIjoiYm05d1UzUmhkR2x2YmxSdmEyVnUifQ.adqiIzFjqZdpJw5uHOHjE5qw2UvCDH2FwMmwlYvr5ljKyPG65ZQe_4wb8NYEQFXmyZZyVu-77xd5Njn310cjMw';
  static const String _defaultUserAgent = 'com.bs.ecommerce/1.0';

  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }

  // Token operations
  Future<void> setToken(String token) async {
    final pref = Get.find<SharedPreferences>();
    await pref.setString(_tokenKey, token);
  }

  Future<void> clearToken() async {
    final pref = Get.find<SharedPreferences>();
    await pref.remove(_tokenKey);
  }

  String? get token {
    return Get.find<SharedPreferences>().getString(_tokenKey);
  }

  // Device ID operations
  Future<void> setDeviceId(String deviceId) async {
    final pref = Get.find<SharedPreferences>();
    await pref.setString(_deviceIdKey, deviceId);
  }

  String get deviceId {
    return Get.find<SharedPreferences>().getString(_deviceIdKey) ??
        _defaultDeviceId;
  }

  Future<void> saveMail(String mail) async {
    final pref = Get.find<SharedPreferences>();
    await pref.setString(SharedPreferencesKey.MAIL.toString(), mail);
  }

  // NST operations
  Future<void> setNst(String nst) async {
    final pref = Get.find<SharedPreferences>();
    await pref.setString(_nstKey, nst);
  }

  String get nst {
    return Get.find<SharedPreferences>().getString(_nstKey) ?? _defaultNst;
  }

  // User Agent
  String get userAgent => _defaultUserAgent;

  // First Open operations
  Future<void> setOpened() async {
    final pref = Get.find<SharedPreferences>();
    await pref.setBool(_isFirstOpenKey, false);
  }

  bool get isFirstOpen {
    return Get.find<SharedPreferences>().getBool(_isFirstOpenKey) ?? true;
  }

  // Clear all data
  Future<void> clearAll() async {
    final pref = Get.find<SharedPreferences>();
    await pref.clear();
  }

  // Geçerli dili kaydetme
  static Future<void> setCurrentLanguage(String languageCode) async {
    final box = GetStorage();
    await box.write(
        SharedPreferencesKey.CURRENTRYANGUAGE.toString(), languageCode);
  }

  // Geçerli dili okuma
  static Locale getCurrentLocal() {
    final box = GetStorage();
    String? langCode =
        box.read(SharedPreferencesKey.CURRENTRYANGUAGE.toString());
    langCode ??= PlatformDispatcher.instance.locale.languageCode;
    if (!LocalizationService.supportedLanguages.containsKey(langCode)) {
      setCurrentLanguage(LocalizationService.defaultLanguage.languageCode);
      return LocalizationService.defaultLanguage;
    }
    var q = LocalizationService.supportedLanguages[langCode] ??
        LocalizationService.defaultLanguage;
    return q;
  }
}

enum SharedPreferencesKey { MAIL, CURRENTRYANGUAGE }
