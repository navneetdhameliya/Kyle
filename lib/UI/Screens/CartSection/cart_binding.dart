import 'package:get/get.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController(),fenix: true);
  }
}
