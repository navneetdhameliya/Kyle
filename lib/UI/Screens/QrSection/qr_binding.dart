import 'package:get/get.dart';
import 'package:kayle/UI/Screens/QrSection/qr_controller.dart';

class QrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrController());
  }
}
