import 'package:get/get.dart';
import 'package:kayle/UI/Screens/HomeSection/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
