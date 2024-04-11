import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/Infrastructure/Services/prefrence_services.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';
import 'package:kayle/UI/Commons/common_text_field.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        id: ControllerId.loginKey,
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColors.background(context),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageConstants.loginGirlImg,
                    height: MediaQuery.of(context).size.height / 2.1,
                    width: double.infinity,
                    fit: BoxFit.fill),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeadlineBodyOneBaseWidget(
                            title: AppConstants.welcomeBack.tr,
                            style: TextStyleConstant.commonStyle(
                                context: context)),
                        const SizedBox(height: 25),
                        commonTextField(
                            context: context,
                            controller: controller.txtEmailController.value,
                            hint: AppConstants.emailAddress.tr,
                            prefixIcon: SvgPicture.asset(
                              ImageConstants.email,
                            )),
                        const SizedBox(height: 12),
                        commonTextField(
                            context: context,
                            controller: controller.txtPasswordController.value,
                            hint: AppConstants.password.tr,
                            suffixIcon:
                                SvgPicture.asset(ImageConstants.hidePassword),
                            prefixIcon: SvgPicture.asset(
                              ImageConstants.password,
                            )),
                        const SizedBox(height: 14),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: CommonInkWell(
                            onTap: () {
                              Get.toNamed(RoutesConstants.forgotPasswordScreen);
                            },
                            child: HeadlineBodyOneBaseWidget(
                              title: AppConstants.forgotPassword.tr,
                              style: TextStyleConstant.commonStyle(
                                context: context,
                                color: ColorConstants.commonYellow,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: CommonButton(
                                title: AppConstants.signUp.tr,
                                onTap: () {
                                  Get.toNamed(RoutesConstants.createAccountScreen);
                                },
                              ),
                            ),
                            const SizedBox(width: 11),
                            Expanded(
                              child: CommonButton(
                                buttonColor: ColorConstants.commonYellow,
                                titleColor: ColorConstants.blackBg,
                                title: AppConstants.sigIn.tr,
                                onTap: () async{
                                  await SharedPreferenceService.saveLoggedIn(true);
                                  Get.toNamed(RoutesConstants.mainScreen);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 27),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: ThemeColors.onSecondary(context),
                                height: 1,
                                width: double.infinity,
                              ),
                            ),
                            HeadlineBodyOneBaseWidget(
                              title: AppConstants.orSignInWith.tr,
                              style: TextStyleConstant.commonStyle(
                                  context: context,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors.primary(context),
                                  fontSize: 12),
                            ).marginSymmetric(horizontal: 19),
                            Expanded(
                              child: Container(
                                color: ThemeColors.onSecondary(context),
                                height: 1,
                                width: double.infinity,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 27),
                        CommonButton(
                          icon: ImageConstants.google,
                          title: AppConstants.signInWithGoogle.tr,
                          onTap: () {},
                        ),
                      ],
                    ).marginSymmetric(vertical: 30, horizontal: 25),
                  ),
                )
              ],
            ),
          );
        });
  }
}
