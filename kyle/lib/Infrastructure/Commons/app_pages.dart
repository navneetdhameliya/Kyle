import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Commons/route_constants.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/onboarding_binding.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/onboarding_screen.dart';
import 'package:kayle/UI/Screens/SplashSection/splash_binding.dart';
import 'package:kayle/UI/Screens/SplashSection/splash_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesConstants.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesConstants.onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
    ),
  ];
}
