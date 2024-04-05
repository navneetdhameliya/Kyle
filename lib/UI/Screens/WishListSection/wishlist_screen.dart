import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/HomeSection/SubScreen/notification_screen.dart';
import 'package:kayle/UI/Screens/WishListSection/wishlist_controller.dart';

class WishListScreen extends GetView<WishListController> {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(
        init: WishListController(),
        id: KeyConstant.cartKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: ListView(
                children: [
                  appBar(),
                  const SizedBox(
                    height: 48,
                  ),
                  wishListTile(context),
                  wishListTile(context),
                  wishListTile(context),
                  wishListTile(context),
                  const SizedBox(
                    height: 36,
                  ),
                  const HeadlineBodyOneBaseWidget(
                    title: "You May Also Like",
                    fontSize: 24,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  newArrival(),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ).paddingSymmetric(horizontal: 24, vertical: 24),
            ),
          );
        });
  }

  Widget appBar() {
    return Row(
      children: [
        SizedBox(
            height: 36,
            width: 36,
            child: Image.asset(ImageConstants.coloredLogoPng)),
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
              onTap: () {
                Get.to(const NotificationScreen());
              },
              child: SvgPicture.asset(
                ImageConstants.notificationIcon,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget newArrival() {
    return GridView.builder(
      itemCount: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 4 / 5),
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                          image: AssetImage(ImageConstants.womenPng),
                          fit: BoxFit.cover),
                    ),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColors.background(context),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        ImageConstants.saveMarkIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12)),
                        color: ThemeColors.background(context),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  ThemeColors.shadow(context).withOpacity(.2),
                              blurRadius: 10,
                              offset: const Offset(0, 6)),
                        ]),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadlineBodyOneBaseWidget(
                          title: "Fashion",
                          titleColor: Colors.black.withOpacity(.4),
                        ),
                        const HeadlineBodyOneBaseWidget(
                          title: "Linen slim-fit t-shirt",
                          fontSize: 12,
                        ),
                        const HeadlineBodyOneBaseWidget(
                          title: "\$ 40.00",
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget wishListTile(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 60,
          width: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ThemeColors.background(context),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorConstants.white),
              image: DecorationImage(
                image: AssetImage(
                  ImageConstants.menPng,
                ),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          width: 14,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeadlineBodyOneBaseWidget(
                title: 'Fashion',
                fontSize: 8.0,
              ),
              HeadlineBodyOneBaseWidget(
                title: 'T-shirt cotton printed',
                fontSize: 12.0,
              ),
              HeadlineBodyOneBaseWidget(
                title: '\$ 40.00',
                fontSize: 14.0,
                fontFamily: FontConstant.blinkerSemiBold,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ThemeColors.buttonActive,
              ),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                ImageConstants.basketIcon,
                height: 16,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.string('<svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg"> <path d="M7.87048 3.98096C7.87048 7.32222 8.35144 8.83255 5.11652 8.83255C1.88119 8.83255 2.37206 7.32222 2.37206 3.98096" stroke="#717171" stroke-width="0.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M8.48547 2.69971H1.7561" stroke="#717171" stroke-width="0.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M6.54787 2.69991C6.54787 2.69991 6.76812 1.13086 5.12049 1.13086C3.47328 1.13086 3.69352 2.69991 3.69352 2.69991" stroke="#717171" stroke-width="0.5" stroke-linecap="round" stroke-linejoin="round"/></svg>',
                height: 16,
              ),
            ),
          ],
        ),
      ],
    ).paddingOnly(bottom: 12);
  }
}
