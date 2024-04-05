import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/HomeSection/SubScreen/notification_screen.dart';
import 'package:kayle/UI/Screens/HomeSection/home_controller.dart';
import 'package:kayle/UI/Screens/HomeSection/widget/filter_tab.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

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
              child: ListView(
                children: [
                  appBar(),
                  const SizedBox(
                    height: 24,
                  ),

                  /// Summer Collection
                  Container(
                    width: double.infinity,
                    height: 156,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(ImageConstants.summerCollectionPng),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ThemeColors.buttonActive,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: HeadlineBodyOneBaseWidget(
                            title: AppConstants.fashionStore.tr,
                            fontSize: 8,
                            fontFamily: FontConstant.blinkerRegular,
                          ),
                        ),
                        HeadlineBodyOneBaseWidget(
                          title: AppConstants.summerCollection.tr,
                          fontSize: 30,
                          titleColor: ColorConstants.white,
                          fontFamily: FontConstant.blinkerBold,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  /// pending offers and discount code
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 115,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColors.buttonActive,
                            image: DecorationImage(
                              image: AssetImage(ImageConstants.linesPng),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Stack(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: HeadlineBodyOneBaseWidget(
                                  title: AppConstants.discountCode.tr,
                                  fontSize: 14,
                                  titleColor: ColorConstants.white,
                                  fontFamily: FontConstant.blinkerBold,
                                ),
                              ),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: HeadlineBodyOneBaseWidget(
                                  title: '54',
                                  fontSize: 50,
                                  titleColor: ColorConstants.white,
                                  fontFamily: FontConstant.blinkerExtraLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          height: 115,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                            image: DecorationImage(
                              image: AssetImage(ImageConstants.linesPng),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Stack(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: HeadlineBodyOneBaseWidget(
                                  title: AppConstants.pendingOffers.tr,
                                  fontSize: 14,
                                  titleColor: ColorConstants.white,
                                  fontFamily: FontConstant.blinkerBold,
                                ),
                              ),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: HeadlineBodyOneBaseWidget(
                                  title: '121',
                                  fontSize: 50,
                                  titleColor: ColorConstants.white,
                                  fontFamily: FontConstant.blinkerExtraLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// new arrival and best seller
                  const SizedBox(
                    height: 24,
                  ),
                  newArrival(),
                  const SizedBox(
                    height: 42,
                  ),
                  suggestions(),
                  const SizedBox(
                    height: 42,
                  ),
                  featuredProduct(context),
                  const SizedBox(
                    height: 46,
                  ),
                  brandsData(context),
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
              onTap: (){
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
    return Column(
      children: [
        TabBar(
          dividerColor: Colors.transparent,
          tabs: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: HeadlineBodyOneBaseWidget(
                  title: AppConstants.newArrival.tr,
                  fontSize: 14.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: HeadlineBodyOneBaseWidget(
                  title: AppConstants.bestSeller.tr,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
          indicatorColor: ColorConstants.commonYellow,
          controller: controller.arrivalTabController,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: (index) {
            controller.arrivalTabIndex.value = index;
            controller.update([KeyConstant.homeKey]);
            // controller.arrivalTabPageController.animateToPage(
            //     index,
            //     duration: const Duration(milliseconds: 500),
            //     curve: Curves.easeIn);
          },
        ),
        const SizedBox(
          height: 24,
        ),
        controller.arrivalTabIndex.value == 0
            ? GridView.builder(
                itemCount: 4,
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
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
                                image: DecorationImage(
                                    image: AssetImage(ImageConstants.menPng),
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
                                      color: ThemeColors.shadow(context)
                                          .withOpacity(.2),
                                      blurRadius: 10,
                                      offset: const Offset(0, 6)),
                                ],
                              ),
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadlineBodyOneBaseWidget(
                                    title: AppConstants.fashion.tr,
                                    titleColor: Colors.black.withOpacity(.4),
                                  ),
                                  const HeadlineBodyOneBaseWidget(
                                    title: "Linen slim-fit t-shirt",
                                    fontSize: 12,
                                    fontFamily: FontConstant.blinkerRegular,
                                  ),
                                  const HeadlineBodyOneBaseWidget(
                                    title: "\$ 40.00",
                                    fontSize: 12,
                                    fontFamily: FontConstant.blinkerRegular,
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
              )
            : GridView.builder(
                itemCount: 4,
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
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
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
                                        color: ThemeColors.shadow(context)
                                            .withOpacity(.2),
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
                                    fontFamily: FontConstant.blinkerRegular,
                                  ),
                                  const HeadlineBodyOneBaseWidget(
                                    title: "\$ 40.00",
                                    fontSize: 12,
                                    fontFamily: FontConstant.blinkerRegular,
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
              ),
      ],
    );
  }

  Widget suggestions() {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              height: 260,
              width: 210,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(ImageConstants.menPng),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget featuredProduct(context) {
    return Column(
      children: [
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
              // controller: controller.homeScrollController,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.featuredTab.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Obx(
                      () => FilterTab(
                        onTap: () {
                          controller.selectedFeaturedTab.value = index;
                          controller.update();
                        },
                        isSelected:
                            index == controller.selectedFeaturedTab.value,
                        tabText: controller.featuredTab[index],
                      ),
                    ),
                  ],
                );
              }),
        ),
        const SizedBox(
          height: 24,
        ),
        GridView.builder(
          itemCount: 4,
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
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
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
                                  color: ThemeColors.shadow(context)
                                      .withOpacity(.2),
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
                              fontFamily: FontConstant.blinkerRegular,
                            ),
                            const HeadlineBodyOneBaseWidget(
                              title: "\$ 40.00",
                              fontSize: 12,
                              fontFamily: FontConstant.blinkerRegular,
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
        ),
        const SizedBox(
          height: 28,
        ),
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: ThemeColors.primary(context),
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: HeadlineBodyOneBaseWidget(
            title: 'View All Categories',
            fontSize: 14,
            fontFamily: FontConstant.blinkerRegular,
            titleColor: ThemeColors.background(context),
          ),
        ),
      ],
    );
  }

  Widget brandsData(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineBodyOneBaseWidget(
          title: 'Brands',
          fontSize: 24,
          fontFamily: FontConstant.blinkerRegular,
          titleColor: ThemeColors.primary(context),
        ),
        const SizedBox(
          height: 24,
        ),
        GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 3 / 2),
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.inversePrimary(context),
                  boxShadow: [
                    BoxShadow(
                      color: ThemeColors.shadow(context).withOpacity(.1),
                      blurRadius: 10,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: HeadlineBodyOneBaseWidget(
                  title: 'Brand',
                  fontSize: 24,
                  fontFamily: FontConstant.blinkerRegular,
                  titleColor: ThemeColors.primary(context),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
