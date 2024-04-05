import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/HomeSection/SubScreen/notification_screen.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
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

                  Column(
                    children: [
                      SvgPicture.string('<svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M47.9803 31.9829L32.0068 47.9561" stroke="#0F0F0F" stroke-linecap="round" stroke-linejoin="round"/><path d="M47.9997 47.9769L31.9995 31.9771" stroke="#0F0F0F" stroke-linecap="round" stroke-linejoin="round"/><path fill-rule="evenodd" clip-rule="evenodd" d="M9.16667 40.0003C9.16667 63.1236 16.8767 70.8336 40 70.8336C63.1233 70.8336 70.8333 63.1236 70.8333 40.0003C70.8333 16.877 63.1233 9.16699 40 9.16699C16.8767 9.16699 9.16667 16.877 9.16667 40.0003Z" stroke="#0F0F0F" stroke-linecap="round" stroke-linejoin="round"/></svg>'),
                      const HeadlineBodyOneBaseWidget(
                        title: 'Your Cart Is Empty',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const HeadlineBodyOneBaseWidget(
                        title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                        fontSize: 10,
                        titleTextAlign: TextAlign.center,
                      ).paddingSymmetric(horizontal: 24),
                    ],
                  ),

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
        }
        );
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

}
