import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/Infrastructure/Shared/PhoneNumber/intl_phone_field.dart';
import 'package:kayle/UI/Commons/common_appbar.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';
import 'package:kayle/UI/Commons/common_text_field.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/LoginSection/login_controller.dart';

class ForgotPasswordTwo extends StatelessWidget {
  const ForgotPasswordTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        id: KeyConstant.forgotPasswordTwoKey,
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const CommonAppBar(),
            backgroundColor: ThemeColors.background(context),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstants.onboardingTwo),
                      fit: BoxFit.fill)),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageConstants.passwordRecoveryGirl,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.55,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        HeadlineBodyOneBaseWidget(
                          title: AppConstants.passwordRecovery.tr,
                          style:
                              TextStyleConstant.commonStyle(context: context),
                        ),
                        HeadlineBodyOneBaseWidget(
                          title: AppConstants.enterPhoneToRecover.tr,
                          style: TextStyleConstant.commonStyle(
                              context: context,
                              color: ThemeColors.secondary(context),
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 28),
                        IntlPhoneField(
                          controller:
                              controller.txtPhoneRecoveryController.value,
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
                            controller.countryCode.value =
                                "${phone.countryCode} ${phone.number}";
                            controller
                                .update([KeyConstant.forgotPasswordTwoKey]);
                          },
                        ),
                        const SizedBox(height: 18),
                        CommonInkWell(
                          onTap: () {
                            Get.toNamed(RoutesConstants.forgotPasswordScreen);
                          },
                          child: HeadlineBodyOneBaseWidget(
                            title: AppConstants.useAnotherMethod.tr,
                            style: TextStyleConstant.commonStyle(
                              context: context,
                              color: ColorConstants.commonYellow,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        CommonButton(
                          buttonColor: ColorConstants.commonYellow,
                          titleColor: ColorConstants.blackBg,
                          title: AppConstants.next.tr,
                          onTap: () {
                            Get.toNamed(RoutesConstants.verifyOtpScreen);
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
