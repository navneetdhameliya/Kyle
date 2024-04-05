import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/HomeSection/home_controller.dart';

class NotificationScreen extends GetView<HomeController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        id: KeyConstant.homeKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  appBar(context),
                  ListView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return notificationTile(
                          unRead: index.isEven?true:false,
                            context: context,
                            timeAgo: '2 hour ago',
                            title:
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et');
                      }),
                ],
              ).paddingSymmetric(horizontal: 24, vertical: 24),
            ),
          );
        });
  }

  Widget appBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ()=>Get.back(),
          child: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              ImageConstants.backButton,
              width: 24,
              height: 24,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ThemeColors.primary(context),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: HeadlineBodyOneBaseWidget(
            title: "NOTIFICATION",
            fontSize: 14.0,
            titleColor: ThemeColors.background(context),
          ),
        ),
        SvgPicture.asset(
          ImageConstants.threeDotesHorizontal,
          width: 24,
          height: 24,
        ),
      ],
    );
  }

  Widget notificationTile(
      {required BuildContext context,
      required String title,
      bool unRead = false,
      required String timeAgo}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 52,
              width: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ThemeColors.background(context),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: ThemeColors.shadow(context).withOpacity(.1),
                      blurRadius: 20,
                      offset: const Offset(0, 6)),
                ],
              ),
              child: SvgPicture.asset(
                ImageConstants.whiteLogo,
                width: 24,
                height: 24,
              ),
            ),
            if(unRead)
            Container(
              height: 8,
              width:  8,
              margin: const EdgeInsets.all(2),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeadlineBodyOneBaseWidget(
                title: title,
                fontSize: 14.0,
                titleColor: unRead?ThemeColors.primary(context):ThemeColors.onSecondary(context),
              ),
              HeadlineBodyOneBaseWidget(
                title: timeAgo,
                fontSize: 8.0,
                titleColor: ThemeColors.onSecondary(context),
              ),
            ],
          ),
        ),
      ],
    ).marginOnly(bottom: 8);
  }
}
