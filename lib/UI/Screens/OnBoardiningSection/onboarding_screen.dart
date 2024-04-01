import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/click_and_share_page.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/create_creative_post_page.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/customize_your_post_page.dart';

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
            backgroundColor: ThemeColors.primarySurface(context),
            body: SizedBox(
              width: MediaQuery.sizeOf(context).height,
              height: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  PageView(
                    children: [
                      FirstOnBoarding(
                          fileUrl: controller.onBoardingFirstImage.value,),
                      SecondOnBoarding(
                          fileUrl: controller.onBoardingSecondImage.value),
                      ThirdOnBoarding(
                          fileUrl: controller.onBoardingThirdImage.value),
                    ],
                  ),
                  /// Skip or Continue Button
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: HeadlineBodyOneBaseWidget(
                        title: controller.initialIndex.value == 0 ||
                            controller.initialIndex.value == 1
                            ? AppConstants.next
                            : AppConstants.getStarted,
                        fontSize: 14.0,
                        titleTextAlign: TextAlign.center,
                        titleColor: Colors.white,
                      ),
                      onTap: () {
                        // controller.getIntroData();
                      },
                    ).paddingAll(20),
                  ),

                  /// Indicator
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            getIndicators(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
  getIndicators() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: controller.initialIndex.value == 0 ? 24 : 10,
          height: 10.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: controller.initialIndex.value == 0
                    ? [
                  const Color(0xff0F0F0F).withOpacity(.2),
                  const Color(0xff0F0F0F).withOpacity(.2)
                ]
                    : [
                  const Color(0xffBDBDBD).withOpacity(.2),
                  const Color(0xffBDBDBD).withOpacity(.2)
                ]),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: controller.initialIndex.value == 1 ? 24 : 10,
          height: 10,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: controller.initialIndex.value == 1
                    ? [
                  const Color(0xff0F0F0F).withOpacity(.2),
                  const Color(0xff0F0F0F).withOpacity(.2)
                ]
                    : [
                  const Color(0xffBDBDBD).withOpacity(.2),
                  const Color(0xffBDBDBD).withOpacity(.2)
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
        const SizedBox(
          width: 6,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: controller.initialIndex.value == 2 ? 24 : 10,
          height: 10.0,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: controller.initialIndex.value == 2
                    ? [
                  const Color(0xff0F0F0F).withOpacity(.2),
                  const Color(0xff0F0F0F).withOpacity(.2)
                ]
                    : [
                  const Color(0xffBDBDBD).withOpacity(.2),
                  const Color(0xffBDBDBD).withOpacity(.2)
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
