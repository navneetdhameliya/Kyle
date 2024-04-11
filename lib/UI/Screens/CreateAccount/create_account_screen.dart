import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/Infrastructure/Shared/PhoneNumber/intl_phone_field.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';
import 'package:kayle/UI/Commons/common_text_field.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

import 'create_account_controller.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(
        init: CreateAccountController(),
        id: ControllerId.createAccountKey,
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColors.background(context),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(ImageConstants.registerGirlImg,
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
                            title: AppConstants.createAccount.tr,
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
                        IntlPhoneField(
                          controller: controller.txtPhoneController.value,
                          style: TextStyleConstant.commonStyle(
                              context: context,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          decoration: InputDecoration(
                              errorBorder: customBorder(context),
                              filled: true,
                              fillColor: ThemeColors.inversePrimary(context),
                              errorStyle: TextStyleConstant.commonStyle(
                                  context: context,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.redAccent),
                              focusedBorder: customBorder(context),
                              enabledBorder: customBorder(context),
                              disabledBorder: customBorder(context),
                              border: customBorder(context),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              hintText: AppConstants.phoneNumber.tr,
                              hintStyle: TextStyleConstant.commonStyle(
                                  color: ThemeColors.secondary(context),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  context: context)),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            // print(phone.completeNumber);
                          },
                        ),
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
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            CommonInkWell(
                              onTap: () {
                                controller.selectedRadio.value =
                                    !controller.selectedRadio.value;
                                controller
                                    .update([ControllerId.createAccountKey]);
                              },
                              child: Container(
                                height: 16,
                                width: 16,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.selectedRadio.value
                                            ? ThemeColors.primary(context)
                                            : ThemeColors.onSecondary(context),
                                        width: 1.5),
                                    shape: BoxShape.circle),
                                padding: const EdgeInsets.all(2),
                                child: controller.selectedRadio.value
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                ThemeColors.primary(context)),
                                      )
                                    : const SizedBox(),
                              ),
                            ).marginOnly(right: 8),
                            Flexible(
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyleConstant.commonStyle(
                                        context: context,
                                        color: ThemeColors.secondary(context),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                    TextSpan(text: AppConstants.agreeWith.tr),
                                    TextSpan(
                                        text: AppConstants.termsPrivacy.tr,
                                        style: TextStyleConstant.commonStyle(
                                          context: context,
                                          color: ColorConstants.commonYellow,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ])),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: CommonButton(
                                title: AppConstants.sigIn.tr,
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ),
                            const SizedBox(width: 11),
                            Expanded(
                              child: CommonButton(
                                buttonColor: ColorConstants.commonYellow,
                                titleColor: ColorConstants.blackBg,
                                title: AppConstants.signUp.tr,
                                onTap: () {
                                  Get.toNamed(
                                      RoutesConstants.setupProfileScreen);
                                },
                              ),
                            ),
                          ],
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
