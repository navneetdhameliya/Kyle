import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/UI/Commons/common_appbar.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_text_field.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/LoginSection/login_controller.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        id: KeyConstant.setNewPasswordKey,
        builder: (controller) {

          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const CommonAppBar(),
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(

              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                  Image.asset(
                      ImageConstants.setNewPwdImg,
                      width: double.infinity,
                      fit: BoxFit.fill,

                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          HeadlineBodyOneBaseWidget(
                            title: AppConstants.setNewPassword.tr,
                            style: TextStyleConstant.commonStyle(context: context),
                          ),
                          HeadlineBodyOneBaseWidget(
                            title: AppConstants.setNewPasswordDesc.tr,
                            style: TextStyleConstant.commonStyle(
                                context: context, color: ThemeColors.secondary(context), fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          const SizedBox(height: 29),
                          commonTextField(
                              context: context,
                              controller: controller.txtSetPasswordController.value,
                              hint: AppConstants.password.tr,
                              suffixIcon: SvgPicture.asset(
                                ImageConstants.hidePassword,
                              ),
                              prefixIcon: SvgPicture.asset(
                                ImageConstants.password,
                              )),
                          const SizedBox(height: 12),

                          commonTextField(
                              context: context,
                              suffixIcon: SvgPicture.asset(
                                ImageConstants.hidePassword,
                              ),
                              controller: controller.txtSetConfirmPasswordController.value,
                              hint: AppConstants.confirmPassword.tr,
                              prefixIcon: SvgPicture.asset(
                                ImageConstants.password,
                              )),
                          const SizedBox(height: 22),
                          CommonButton(
                            buttonColor: ColorConstants.commonYellow,
                            titleColor: ColorConstants.blackBg,
                            title: AppConstants.changePassword.tr,
                            onTap: () {

                              Get.offAllNamed(RoutesConstants.loginScreen);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
