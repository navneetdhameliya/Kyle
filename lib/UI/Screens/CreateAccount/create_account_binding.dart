import 'package:get/get.dart';
import 'package:kayle/UI/Screens/LoginSection/login_controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
