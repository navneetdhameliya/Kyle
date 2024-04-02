import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Screens/CreateAccount/SubScreens/setup_profile.dart';
import 'package:kayle/UI/Screens/CreateAccount/creaet_account_screen.dart';
import 'package:kayle/UI/Screens/CreateAccount/create_account_binding.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/forgot_password.dart';
import 'package:kayle/UI/Screens/LoginSection/login_binding.dart';
import 'package:kayle/UI/Screens/LoginSection/login_screen.dart';
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
    GetPage(
      name: RoutesConstants.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.createAccountScreen,
      page: () => const CreateAccountScreen(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: RoutesConstants.setupProfileScreen,
      page: () => const SetupProfileScreen(),
      binding: CreateAccountBinding(),
    ),GetPage(
      name: RoutesConstants.forgotPasswordScreen,
      page: () => const ForgotPassword(),
      binding: LoginBinding(),
    ),
  ];
}
