import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/CartSection/widgets/cart_item_card.dart';
import 'package:kayle/UI/Screens/CartSection/widgets/total_price_view_bottom_bar.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/common_product_details_appbar.dart';

class ProceedToCheckoutScreen extends StatelessWidget {
  const ProceedToCheckoutScreen({super.key});

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
              const CommonProductDetailsAppBar(title: "CART"),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItemDataList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        } else{
                          controller.cartItemDataList.removeAt(index);
                        }
                        controller.getTotalPrice();
                        controller.update([ControllerId.cartKey]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: TotalPriceViewBottomBar(
            buttonText: "Proceed To Checkout",
            onTap: (){
              Get.toNamed(RoutesConstants.checkoutScreen);
            },
          ),
        );
      },
    );
  }
}
