

import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';

class SplashController extends GetxController {



  moveToNext() async {
    // bool isLoggedIn = await SharedPreferenceService.getLoggedIn;
    await Future.delayed(2.seconds);
    // if (isLoggedIn) {
    //
    //
    // } else {
    Get.toNamed(RoutesConstants.onBoardingScreen);
    //  Get.toNamed(RoutesConstants.loginScreen);
    // }
  }
  @override
  void onInit() {
    moveToNext();
    super.onInit();
  }
}
