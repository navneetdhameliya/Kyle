import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Screens/CartSection/cart_binding.dart';
import 'package:kayle/UI/Screens/CartSection/cart_screen.dart';
import 'package:kayle/UI/Screens/CreateAccount/SubScreens/setup_profile.dart';
import 'package:kayle/UI/Screens/CreateAccount/creaet_account_screen.dart';
import 'package:kayle/UI/Screens/CreateAccount/create_account_binding.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/forgot_password_one.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/forgot_password_two.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/set_new_password.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/verify_otp_screen.dart';
import 'package:kayle/UI/Screens/LoginSection/login_binding.dart';
import 'package:kayle/UI/Screens/LoginSection/login_screen.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/onboarding_binding.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/onboarding_screen.dart';
import 'package:kayle/UI/Screens/ProfileSection/profile_binding.dart';
import 'package:kayle/UI/Screens/ProfileSection/profile_screen.dart';
import 'package:kayle/UI/Screens/QrSection/qr_binding.dart';
import 'package:kayle/UI/Screens/QrSection/qr_screen.dart';
import 'package:kayle/UI/Screens/SplashSection/splash_binding.dart';
import 'package:kayle/UI/Screens/SplashSection/splash_screen.dart';
import 'package:kayle/UI/Screens/WishListSection/wishlist_binding.dart';
import 'package:kayle/UI/Screens/WishListSection/wishlist_screen.dart';

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
    ),
    GetPage(
      name: RoutesConstants.forgotPasswordScreen,
      page: () => const ForgotPasswordOne(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.forgotPasswordTwoScreen,
      page: () => const ForgotPasswordTwo(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.verifyOtpScreen,
      page: () => const VerifyOtpScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.setNewPasswordScreen,
      page: () => const SetNewPasswordScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesConstants.cartScreen,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.wishListScreen,
      page: () => const WishListScreen(),
      binding: WishListBinding(),
    ),
    GetPage(
      name: RoutesConstants.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RoutesConstants.qrScreen,
      page: () => QrScreen(),
      binding: QrBinding(),
    ),
  ];
}
