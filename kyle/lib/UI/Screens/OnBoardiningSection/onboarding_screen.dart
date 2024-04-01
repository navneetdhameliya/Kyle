import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';

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
                  Expanded(
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
