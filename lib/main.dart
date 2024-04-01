import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_pages.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/Constants/theme_constant.dart';
import 'package:kayle/Infrastructure/Language/translation_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? preferences;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      getPages: AppPages.routes,
      initialRoute: RoutesConstants.splashScreen,
      darkTheme: ConstantTheme.darkTheme,
      theme: ConstantTheme.lightTheme,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
