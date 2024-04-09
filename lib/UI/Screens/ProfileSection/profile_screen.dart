import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/ProfileSection/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        id: KeyConstant.profileKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: ListView(
                children: [
                  appBar(context),
                  const SizedBox(
                    height: 20,
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: 'Account',
                    fontSize: 12,
                    titleColor: ThemeColors.onSecondary(context),
                  ).paddingSymmetric(horizontal: 24, vertical: 12),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.accountItems.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return settingTile(
                                context: context,
                                index: index,
                                title: controller.accountItems[index].name,
                                icon: controller.accountItems[index].icon)
                            .paddingSymmetric(horizontal: 24);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: 'Privacy',
                    fontSize: 12,
                    titleColor: ThemeColors.onSecondary(context),
                  ).paddingSymmetric(horizontal: 24, vertical: 12),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.privacyItems.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return settingTile(
                                context: context,
                                index: index,
                                title: controller.privacyItems[index].name,
                                icon: controller.privacyItems[index].icon)
                            .paddingSymmetric(horizontal: 24);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: 'Help & Support',
                    fontSize: 12,
                    titleColor: ThemeColors.onSecondary(context),
                  ).paddingSymmetric(horizontal: 24, vertical: 12),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.helpItems.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return settingTile(
                                context: context,
                                index: index,
                                title: controller.helpItems[index].name,
                                icon: controller.helpItems[index].icon)
                            .paddingSymmetric(horizontal: 24);
                      }),
                  const SizedBox(
                    height: 65,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget appBar(context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/profile_screen_bg.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          height: 24,
                          width: 24,
                          child: SvgPicture.asset(ImageConstants.backButton)),
                      const Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(
                            ImageConstants.searchIcon,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              ImageConstants.notificationIcon,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ThemeColors.background(context),
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorConstants.white),
                            boxShadow: [
                              BoxShadow(
                                  color: ThemeColors.shadow(context)
                                      .withOpacity(.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 6)),
                            ],
                            image: DecorationImage(
                              image: AssetImage(
                                ImageConstants.menPng,
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const HeadlineBodyOneBaseWidget(
                              title: 'Savannah Robertson',
                              fontSize: 16.0,
                              titleColor: Colors.black,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConstants.white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              child: const HeadlineBodyOneBaseWidget(
                                title: '@Savannah92',
                                fontSize: 8.0,
                                titleColor: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ).paddingSymmetric(horizontal: 24, vertical: 32),
                  const SizedBox(
                    height: 45,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
          ],
        ),
        Container(
          height: 69,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ThemeColors.inversePrimary(context),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: ThemeColors.shadow(context).withOpacity(.12),
                  blurRadius: 30,
                  offset: const Offset(0, 6)),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstants.walletIcon,
                    colorFilter: ColorFilter.mode(
                        ThemeColors.buttonActive, BlendMode.srcIn),
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: 'Wallet',
                    fontSize: 10,
                    titleColor: ThemeColors.onSecondary(context),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstants.basketIcon,
                    colorFilter: ColorFilter.mode(
                        ThemeColors.buttonActive, BlendMode.srcIn),
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: 'Order',
                    fontSize: 10,
                    titleColor: ThemeColors.onSecondary(context),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstants.discountIcon,
                    colorFilter: ColorFilter.mode(
                        ThemeColors.buttonActive, BlendMode.srcIn),
                  ),
                  HeadlineBodyOneBaseWidget(
                    title: 'Discount',
                    fontSize: 10,
                    titleColor: ThemeColors.onSecondary(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget settingTile(
      {context,
      required int index,
      required String title,
      required String icon,
      Color iconColor = Colors.black}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeColors.inversePrimary(context),
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(index == 0 ? 10 : 0),
            bottom: Radius.circular(index == 4 ? 10 : 0)),
        boxShadow: [
          BoxShadow(
              color: ThemeColors.shadow(context).withOpacity(.12),
              blurRadius: 30,
              offset: const Offset(0, 6)),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  icon,
                  colorFilter: ColorFilter.mode(
                      ThemeColors.primary(context), BlendMode.srcIn),
                ),
              ).paddingOnly(right: 8),
              HeadlineBodyOneBaseWidget(
                title: title,
                fontSize: 12,
                titleColor: ThemeColors.primary(context),
              ),
            ],
          ),
          SvgPicture.asset(
            ImageConstants.rightArrowIcon,
            colorFilter:
                ColorFilter.mode(ThemeColors.primary(context), BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
