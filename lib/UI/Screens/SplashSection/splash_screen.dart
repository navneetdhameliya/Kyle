import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        id: KeyConstant.splashKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: AlignmentDirectional.bottomCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? ImageConstants.splashImageDark
                        : ImageConstants.splashImageLight),
                    fit: BoxFit.fill),
              ),
              child: HeadlineBodyOneBaseWidget(
                title: AppConstants.ecommerceStore.tr,
                fontSize: 12,
                titleColor: ThemeColors.primary(context),
              ).marginOnly(bottom: 25),
            ),
          );
        });
  }
}
