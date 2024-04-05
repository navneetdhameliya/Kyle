import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/fourth_on_boarding.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/third_on_boarding.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/first_on_boarding.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/second_on_boarding.dart';

import 'onboarding_controller.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        key: KeyConstant.onboardingKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  PageView(

                    controller: controller.introController.value,
                    onPageChanged: controller.onPageChanged,
                    children: [
                      FirstOnBoarding(
                          fileUrl: controller.onBoardingFirstImage.value),
                      SecondOnBoarding(
                          fileUrl: controller.onBoardingSecondImage.value),
                      ThirdOnBoarding(
                          fileUrl: controller.onBoardingThirdImage.value),
                      FourthOnBoarding(
                          fileUrl: controller.onBoardingFourthImage.value),
                    ],
                  ),
                  /// Skip or Continue Button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CommonInkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 26),
                        decoration: BoxDecoration(
                          color: ThemeColors.buttonActive,
                          borderRadius: BorderRadius.circular(50) ,
                        ),
                        child: HeadlineBodyOneBaseWidget(
                          title:
                          AppConstants.getStarted.tr,
                          fontSize: 14.0,
                          titleTextAlign: TextAlign.center,
                          titleColor: ThemeColors.buttonText,
                        ),
                      ),
                      onTap: () {
                        if(controller.initialIndex.value==3){
                        Get.offAllNamed(RoutesConstants.loginScreen);
                        }else{
                        controller.initialIndex.value=controller.initialIndex.value+1;
                        controller.update([KeyConstant.onboardingKey]);
                         controller.introController.value.animateToPage(controller.initialIndex.value, duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
                        }
                      },
                    ).paddingAll(20),
                  ),

                  /// Indicator
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: getIndicators(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  getIndicators(context) {
    double height = 4;
    double width = 8;
    double space = 10;
    double expandedWidth = 30;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: controller.initialIndex.value == 0 ? expandedWidth : width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: controller.initialIndex.value == 0
                    ? MediaQuery.of(context).platformBrightness == Brightness.dark?[
                  ThemeColors.buttonActive,
                  ThemeColors.buttonActive,
                ]:[
                  ThemeColors.primary(context),
                  ThemeColors.primary(context),
                ]
                    : [
                  const Color(0xffBDBDBD),
                  const Color(0xffBDBDBD),
                ]),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
         SizedBox(
          width: space,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: controller.initialIndex.value == 1 ? expandedWidth : width,
          height: height,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: controller.initialIndex.value == 1
                    ? MediaQuery.of(context).platformBrightness == Brightness.dark?[
                  ThemeColors.buttonActive,
                  ThemeColors.buttonActive,
                ]:[
                  ThemeColors.primary(context),
                  ThemeColors.primary(context),
                ]
                    : [
                  const Color(0xffBDBDBD),
                  const Color(0xffBDBDBD),
                ]),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50.0,
                ),
              ),
            ),
          ),
        ),
         SizedBox(
          width: space,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: controller.initialIndex.value == 2 ? expandedWidth : width,
          height: height,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: controller.initialIndex.value == 2
                    ? MediaQuery.of(context).platformBrightness == Brightness.dark?[
                  ThemeColors.buttonActive,
                  ThemeColors.buttonActive,
                ]:[
                  ThemeColors.primary(context),
                  ThemeColors.primary(context),
                ]
                    : [
                  const Color(0xffBDBDBD),
                  const Color(0xffBDBDBD),
                ]),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: space,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: controller.initialIndex.value == 3 ? expandedWidth : width,
          height: height,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: controller.initialIndex.value == 3
                    ? MediaQuery.of(context).platformBrightness == Brightness.dark?[
                  ThemeColors.buttonActive,
                  ThemeColors.buttonActive,
                ]:[
                  ThemeColors.primary(context),
                  ThemeColors.primary(context),
                ]
                    : [
                  const Color(0xffBDBDBD),
                  const Color(0xffBDBDBD),
                ]),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  50.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
