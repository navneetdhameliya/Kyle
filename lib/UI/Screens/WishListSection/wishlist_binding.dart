import 'package:get/get.dart';
import 'package:kayle/UI/Screens/WishListSection/wishlist_controller.dart';

class WishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishListController());
  }
}
