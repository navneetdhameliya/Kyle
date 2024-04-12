import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Screens/CartSection/SubScreen/add_new_address_screen.dart';
import 'package:kayle/UI/Screens/CartSection/SubScreen/add_new_card_screen.dart';
import 'package:kayle/UI/Screens/CartSection/SubScreen/address_screen.dart';
import 'package:kayle/UI/Screens/CartSection/SubScreen/checkout_screen.dart';
import 'package:kayle/UI/Screens/CartSection/SubScreen/confirm_order_screen.dart';
import 'package:kayle/UI/Screens/CartSection/SubScreen/payment_method_screen.dart';
import 'package:kayle/UI/Screens/CartSection/SubScreen/proceed_to_checkout.dart';
import 'package:kayle/UI/Screens/CartSection/cart_binding.dart';
import 'package:kayle/UI/Screens/CartSection/cart_screen.dart';
import 'package:kayle/UI/Screens/CreateAccount/SubScreens/setup_profile.dart';
import 'package:kayle/UI/Screens/CreateAccount/create_account_screen.dart';
import 'package:kayle/UI/Screens/CreateAccount/create_account_binding.dart';
import 'package:kayle/UI/Screens/HomeSection/SubScreen/notification_screen.dart';
import 'package:kayle/UI/Screens/HomeSection/home_binding.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/forgot_password_one.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/forgot_password_two.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/set_new_password.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/verify_otp_screen.dart';
import 'package:kayle/UI/Screens/LoginSection/login_binding.dart';
import 'package:kayle/UI/Screens/LoginSection/login_screen.dart';
import 'package:kayle/UI/Screens/MainSection/main_binding.dart';
import 'package:kayle/UI/Screens/MainSection/main_screen.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/onboarding_binding.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/onboarding_screen.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/SubScreen/add_review_screen.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/SubScreen/description_screen.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/SubScreen/review_screen.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_binding.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_screen.dart';
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
      name: RoutesConstants.mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RoutesConstants.cartScreen,
      page: () => const CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.proceedToCheckoutScreen,
      page: () => const ProceedToCheckoutScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.checkoutScreen,
      page: () => const CheckoutScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.paymentMethodScreen,
      page: () => const PaymentMethodScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.addNewAddressScreen,
      page: () => const AddNewAddressScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.addressScreen,
      page: () => const AddressScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.addNewCardScreen,
      page: () => const AddNewCardScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: RoutesConstants.confirmOrderScreen,
      page: () => const ConfirmOrderScreen(),
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
      page: () => const QrScreen(),
      binding: QrBinding(),
    ),
    GetPage(
      name: RoutesConstants.productDetailsScreen,
      page: () => const ProductDetailsScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: RoutesConstants.productDescriptionScreen,
      page: () => const ProductDescriptionScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: RoutesConstants.productReviewScreen,
      page: () => const ProductReviewScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: RoutesConstants.addReviewScreen,
      page: () => const AddReviewScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: RoutesConstants.notificationScreen,
      page: () => const NotificationScreen(),
      binding: HomeBinding(),
    ),
  ];
}
