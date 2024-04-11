import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/CartSection/widgets/cart_item_card.dart';
import 'package:kayle/UI/Screens/HomeSection/widget/product_card.dart';
import 'package:kayle/UI/Screens/MainSection/widget/common_main_appbar.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        id: ControllerId.cartKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            appBar: AppBar(
              toolbarHeight: 0,
              scrolledUnderElevation: 0,
              backgroundColor: ThemeColors.background(context),
            ),
            body: Column(
              children: [
                const CommonMainAppBar(),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 24),
                      controller.cartItemDataList.isNotEmpty
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.builder(
                                  itemCount: controller.cartItemDataList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return CartItemCard(
                                      data: controller.cartItemDataList[index],
                                      onAddTap: () {
                                        controller.cartItemDataList[index].productQuantity += 1;
                                        controller.update([ControllerId.cartKey]);
                                      },
                                      onRemoveTap: () {
                                        if (controller.cartItemDataList[index].productQuantity > 1) {
                                          controller.cartItemDataList[index].productQuantity -= 1;
                                        }else{
                                          controller.cartItemDataList.removeAt(index);
                                        }
                                        controller.update([ControllerId.cartKey]);
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 24),
                                CommonButton(
                                  title: "Proceed",
                                  buttonColor: ColorConstants.commonYellow,
                                  onTap: () {
                                    controller.getTotalPrice();
                                    Get.toNamed(RoutesConstants.proceedToCheckoutScreen);
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SvgPicture.asset(
                                  ImageConstants.noCartItemIcon,
                                  colorFilter: ColorFilter.mode(
                                      ThemeColors.primary(context),
                                      BlendMode.srcIn,
                                  ),
                                ),
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
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 24, vertical: 24),
          );
        },
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
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
            image: index % 4 == 0 || index % 4 == 3
                ? ImageConstants.womenPng
                : ImageConstants.menPng);
      },
    );
  }
}
