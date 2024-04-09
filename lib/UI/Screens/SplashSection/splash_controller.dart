import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';

class SplashController extends GetxController {
  moveToNext() async {
    await Future.delayed(2.seconds);
    Get.toNamed(RoutesConstants.onBoardingScreen);
  }

  @override
  void onInit() {
    moveToNext();
    super.onInit();
  }
}
