import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';

class OnBoardingController extends GetxController {
  RxString onBoardingFirstImage = ImageConstants.onboardingOne.obs;
  RxString onBoardingSecondImage = ImageConstants.onboardingTwo.obs;
  RxString onBoardingThirdImage = ImageConstants.onboardingThree.obs;
  RxString onBoardingFourthImage = ImageConstants.onboardingFour.obs;

  RxInt initialIndex = 0.obs;
  Rx<PageController> introController = PageController().obs;

  onPageChanged(int value) {
    initialIndex.value = value;
    update();
  }
}
