import 'package:get/get.dart';
import 'package:kayle/UI/Screens/SplashSection/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
