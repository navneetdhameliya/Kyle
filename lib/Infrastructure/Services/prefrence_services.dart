import 'package:flutter/foundation.dart';
import 'package:kayle/Infrastructure/Constants/storage_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static SharedPreferenceService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferenceService> getInstance() async {
    _instance ??= SharedPreferenceService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // General Methods: ----------------------------------------------------------

  static clearPreference() async {
    await getInstance();
    await _preferences!.clear();
  }

  static Future<void> saveValue(String key, String value) async {
    await getInstance();
    await _preferences!.setString(key, value);
  }

  static Future<String> getValue(String key) async {
    await getInstance();
    try {
      return _preferences!.getString(key) ?? "";
    } catch (e) {
      return '';
    }
  }

  static Future<void> saveBoolValue(String key, bool value) async {
    await getInstance();
    await _preferences!.setBool(key, value);
  }

  static Future<bool?> getBoolValue(String key) async {
    await getInstance();
    try {
      return _preferences!.getBool(key);
    } catch (e) {
      return null;
    }
  }

  static Future<void> removeValue(String key) async {
    await getInstance();
    try {
      await _preferences!.remove(key);
    } catch (e) {
      if (kDebugMode) {
        print("remove value : ${e.runtimeType.toString()}");
      }
    }
  }

  static Future<bool> checkIsKeyAvailable(String key) async {
    await getInstance();
    return _preferences!.containsKey(key);
  }

  //language
  static Future<String?> get getLanguage async {
    await getInstance();
    return _preferences!.getString(StorageConstants.language);
  }

  static Future<void> saveLanguage(String lng) async {
    await getInstance();
    await _preferences!.setString(StorageConstants.language, lng);
  }

  //translate to language
  static Future<String?> get getTranslateToLanguage async {
    await getInstance();
    return _preferences!.getString(StorageConstants.translateToLanguage);
  }

  static Future<void> saveTranslateToLanguage(String lng) async {
    await getInstance();
    await _preferences!.setString(StorageConstants.translateToLanguage, lng);
  }

  //Device Language
  static Future<bool?> get getDeviceLanguage async {
    await getInstance();
    return _preferences!.getBool(StorageConstants.deviceLanguage);
  }

  static Future<void> saveDeviceLanguage(bool lng) async {
    await getInstance();
    await _preferences!.setBool(StorageConstants.deviceLanguage, lng);
  }

  //Translate To Device Language
  static Future<bool?> get getTranslateDeviceLanguage async {
    await getInstance();
    return _preferences!.getBool(StorageConstants.translateToDeviceLanguage);
  }

  static Future<void> saveTranslateDeviceLanguage(bool lng) async {
    await getInstance();
    await _preferences!
        .setBool(StorageConstants.translateToDeviceLanguage, lng);
  }
}
