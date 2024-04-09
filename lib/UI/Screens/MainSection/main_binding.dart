import 'package:get/get.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/HomeSection/home_controller.dart';
import 'package:kayle/UI/Screens/MainSection/main_controller.dart';
import 'package:kayle/UI/Screens/ProfileSection/profile_controller.dart';
import 'package:kayle/UI/Screens/QrSection/qr_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => QrController());
  }
}
