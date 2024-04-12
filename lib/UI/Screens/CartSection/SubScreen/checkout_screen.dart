import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Commons/square_small_button.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/CartSection/widgets/cart_item_card.dart';
import 'package:kayle/UI/Screens/CartSection/widgets/total_price_view_bottom_bar.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/common_product_details_appbar.dart';

class CheckoutScreen extends GetView<CartController> {
  const CheckoutScreen({super.key});

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
              const CommonProductDetailsAppBar(title: "CHECK OUT"),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    locationCard(context: context),
                    const SizedBox(height: 24),
                    Divider(
                      color: ThemeColors.border(context),
                      height: 0,
                      thickness: 1,
                    ),
                    ListView.builder(
                      itemCount: controller.cartItemDataList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      itemBuilder: (context, index) {
                        return CartItemCard(
                          data: controller.cartItemDataList[index],
                          onAddTap: () {
                            controller.cartItemDataList[index].productQuantity += 1;
                            controller.getTotalPrice();
                            controller.update([ControllerId.cartKey]);
                          },
                          onRemoveTap: () {
                            if (controller.cartItemDataList[index].productQuantity > 1) {
                              controller.cartItemDataList[index].productQuantity -= 1;
                            } else {
                              controller.cartItemDataList.removeAt(index);
                            }
                            controller.getTotalPrice();
                            controller.update([ControllerId.cartKey]);
                          },
                        );
                      },
                    ),
                    Divider(
                      color: ThemeColors.border(context),
                      height: 0,
                      thickness: 1,
                    ),
                    const SizedBox(height: 24),
                    paymentMethodCard(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: TotalPriceViewBottomBar(
            buttonText: "Order Now",
            onTap: () {
              // Get.toNamed(RoutesConstants.checkoutScreen);
            },
          ),
        );
      },
    );
  }

  Widget locationCard({required BuildContext context}) {
    return Row(
      children: [
        Container(
          height: 94,
          width: 94,
          decoration: BoxDecoration(
              border: Border.all(color: ColorConstants.commonYellow, width: 1.5),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(ImageConstants.mapImg),
                fit: BoxFit.cover,
              ),
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadlineBodyOneBaseWidget(
                title: "My Home",
                fontSize: 14,
                titleColor: ColorConstants.commonYellow,
                fontFamily: FontConstant.blinkerSemiBold,
              ),
              const SizedBox(height: 6),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * .35,
                ),
                child: HeadlineBodyOneBaseWidget(
                  title: "4517 Washington Ave. Manchester, Kentucky 39495",
                  fontSize: 10,
                  titleColor: ThemeColors.secondary(context),
                  fontFamily: FontConstant.blinkerRegular,
                ),
              ),
              const SizedBox(height: 6),
              HeadlineBodyOneBaseWidget(
                title: "(208) 555-0112",
                fontSize: 10,
                titleColor: ThemeColors.secondary(context),
                fontFamily: FontConstant.blinkerRegular,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SquareSmallButton(
          dimension: 16,
          imagePath: ImageConstants.iosForwardIcon,
          iconColor: ThemeColors.primary(context),
        ),
      ],
    );
  }

  Widget paymentMethodCard(){
    return GestureDetector(
      onTap: (){
        Get.toNamed(RoutesConstants.paymentMethodScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorConstants.commonYellow,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                ImageConstants.masterCardImg,
                height: 16,
              ),
            ),
            const SizedBox(width: 10),
            HeadlineBodyOneBaseWidget(
              title: "Master Card",
            )
          ],
        ),
      ),
    );
  }
}
