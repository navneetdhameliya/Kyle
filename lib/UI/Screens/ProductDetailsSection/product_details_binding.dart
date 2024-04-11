import 'package:get/get.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_controller.dart';

class ProductDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
    Get.lazyPut(() => CartController(),fenix: true);
  }

}