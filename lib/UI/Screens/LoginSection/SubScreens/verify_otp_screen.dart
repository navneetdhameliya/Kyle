import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/LoginSection/SubScreens/otp_text_field.dart';
import 'package:kayle/UI/Screens/LoginSection/login_controller.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        id: KeyConstant.verifyOtpKey,
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      top: 0,
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: Image.asset(
                        ImageConstants.verifyOtpBg,
                        fit: BoxFit.fill,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
                    child: SafeArea(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                CommonInkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: SvgPicture.asset(ImageConstants.backButton,
                                            colorFilter: ColorFilter.mode(ThemeColors.primary(context), BlendMode.srcIn)))),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    HeadlineBodyOneBaseWidget(
                                      title: AppConstants.verificationCode.tr,
                                      style: TextStyleConstant.commonStyle(context: context),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyleConstant.commonStyle(
                                                context: context, color: ThemeColors.secondary(context), fontWeight: FontWeight.w400, fontSize: 14),
                                            children: [
                                          TextSpan(
                                            text: AppConstants.verificationCodeSent.tr,
                                          ),
                                          if (controller.txtPhoneRecoveryController.value.text.isNotEmpty)
                                            TextSpan(
                                                text: "\n${controller.countryCode.value}",
                                                style: TextStyleConstant.commonStyle(
                                                    context: context,
                                                    color: ThemeColors.primary(context),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14)),
                                        ])),
                                    const SizedBox(height: 11),
                                    CommonInkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: HeadlineBodyOneBaseWidget(
                                        title: AppConstants.changePhoneNumber.tr,
                                        style: TextStyleConstant.commonStyle(
                                          context: context,
                                          color: ColorConstants.commonYellow,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Center(
                                      child: OtpTextField(
                                        textStyle: TextStyleConstant.commonStyle(context: context, fontWeight: FontWeight.w400, fontSize: 14),
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05 / 2),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    if(controller.enableResend)
                                    Center(
                                      child: HeadlineBodyOneBaseWidget(
                                        titleTextAlign: TextAlign.center,
                                        style: TextStyleConstant.commonStyle(context: context, fontWeight: FontWeight.w400, fontSize: 12),
                                        title: "01:${controller.secondsRemaining<10?"0":""}${controller.secondsRemaining}",
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CommonButton(
                                  title: AppConstants.resend.tr,
                                  onTap:()=>controller.enableResend ? {} : controller.resetTimer(context),
                                ),
                              ),
                              const SizedBox(width: 11),
                              Expanded(
                                child: CommonButton(
                                  buttonColor: ColorConstants.commonYellow,
                                  titleColor: ColorConstants.blackBg,
                                  title: AppConstants.confirm.tr,
                                  onTap: () {
                                    Get.toNamed(RoutesConstants.setNewPasswordScreen);
                                  },
                                ),
                              ),
                            ],
                          ).marginOnly(bottom: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
