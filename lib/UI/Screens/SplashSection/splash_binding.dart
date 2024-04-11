import 'package:get/get.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/SplashSection/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.put(CartController(),permanent: true);
  }
}
