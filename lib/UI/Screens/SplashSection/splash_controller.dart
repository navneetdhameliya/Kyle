import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/Services/prefrence_services.dart';

class SplashController extends GetxController {
  moveToNext() async {
    bool isLoggedIn = await SharedPreferenceService.getLoggedIn;
    await Future.delayed(2.seconds);
    if(isLoggedIn){
      Get.offAllNamed(RoutesConstants.mainScreen);
    }else{
      Get.offAllNamed(RoutesConstants.onBoardingScreen);
    }
  }

  @override
  void onInit() {
    moveToNext();
    super.onInit();
  }
}
