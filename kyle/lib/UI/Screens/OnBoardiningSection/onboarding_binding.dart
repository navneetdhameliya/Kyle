import 'package:get/get.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
