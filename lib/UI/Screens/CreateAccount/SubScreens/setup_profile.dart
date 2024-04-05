import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/UI/Commons/common_appbar.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';
import 'package:kayle/UI/Commons/common_text_field.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/CreateAccount/create_account_controller.dart';
import 'package:kayle/UI/Screens/MainSection/main_screen.dart';

class SetupProfileScreen extends GetView<CreateAccountController> {
  const SetupProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(
        init: CreateAccountController(),
        id: KeyConstant.setUpAccountKey,
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColors.background(context),
            appBar: const CommonAppBar(),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadlineBodyOneBaseWidget(title: AppConstants.setUpProfile.tr, style: TextStyleConstant.commonStyle(context: context)),
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Image.asset(
                                        ImageConstants.setupProfileShadow,
                                      )),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height * 0.2 / 3.2,
                                    left: 0,
                                    right: controller.selectedImage != null
                                        ? MediaQuery.of(context).size.width * 0.03
                                        : MediaQuery.of(context).size.width * 0.04,
                                    child:  Stack(
                                      alignment:Alignment.center,
                                      children: [
                                        controller.selectedImage != null
                                            ? SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.09,
                                          child: CircleAvatar(
                                              radius: 33,
                                              child: SizedBox(
                                                width: MediaQuery.of(context).size.height * 0.09,
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: Image.file(
                                                      File(controller.selectedImage!.path),
                                                      fit: BoxFit.fill,
                                                    )),
                                              )),
                                        )
                                            :
                                        Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(26),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: ThemeColors.primary(context).withOpacity(0.1),
                                                    blurRadius: 25,
                                                    offset: const Offset(0, 4),
                                                    spreadRadius: 1)
                                              ],
                                              gradient: LinearGradient(
                                                  tileMode: TileMode.mirror,
                                                  begin: AlignmentDirectional.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: MediaQuery.of(context).platformBrightness == Brightness.dark
                                                      ? [ColorConstants.black2a2a, ColorConstants.black2a2a]
                                                      : [ColorConstants.whiteF9f8, ColorConstants.whiteF5e])),
                                          child: SvgPicture.asset(
                                            ImageConstants.fullName,
                                            colorFilter: ColorFilter.mode(ThemeColors.onBackground(context), BlendMode.srcIn),
                                          ),
                                        ),
                                        Positioned(
                                            top: 0,
                                            left: MediaQuery.of(context).size.width * 0.5 / 1.9,
                                            child: CommonInkWell(
                                              onTap: () async {
                                                final ImagePicker picker = ImagePicker();
                                                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                                                if (image != null) {
                                                  controller.selectedImage = image;
                                                  controller.update([KeyConstant.setUpAccountKey]);
                                                }
                                              },
                                              child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: const BoxDecoration(color: ColorConstants.commonYellow, shape: BoxShape.circle),
                                                  child: SvgPicture.asset(
                                                    ImageConstants.camera,
                                                    colorFilter: ColorFilter.mode(ThemeColors.background(context), BlendMode.srcIn),
                                                  )),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: HeadlineBodyOneBaseWidget(
                                        title: AppConstants.choseYourImage.tr,
                                        style: TextStyleConstant.commonStyle(
                                            context: context, color: ThemeColors.onBackground(context), fontSize: 14, fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                          commonTextField(
                              context: context,
                              controller: controller.txtFullNameController.value,
                              hint: AppConstants.fullName.tr,
                              prefixIcon: SvgPicture.asset(ImageConstants.fullName)),
                          const SizedBox(height: 12),
                          commonTextField(
                            onTap: () {
                              controller.selectBirthDate(context);
                            },
                              readOnly:true,
                              context: context,
                              controller: controller.txtDateOfBirth.value,
                              hint: AppConstants.dob.tr,
                              prefixIcon: SvgPicture.asset(ImageConstants.dob)),
                          const SizedBox(height: 12),
                          commonTextField(
                              context: context,
                              controller: controller.txtRegion.value,
                              hint: AppConstants.region.tr,
                              prefixIcon: SvgPicture.asset(ImageConstants.region)),
                          const SizedBox(height: 12),
                          commonTextField(
                              context: context,
                              suffixIcon: SvgPicture.asset(ImageConstants.edit),
                              controller: controller.txtGender.value,
                              hint: AppConstants.gender.tr,
                              prefixIcon: SvgPicture.asset(ImageConstants.gender)),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          title: AppConstants.skip.tr,
                          onTap: () {
                            Get.to(const MainScreen());
                          },
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: CommonButton(
                          buttonColor: ColorConstants.commonYellow,
                          titleColor: ColorConstants.blackBg,
                          title: AppConstants.goToShopping.tr,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: 25),
                ],
              ),
            ),
          );
        });
  }
}
