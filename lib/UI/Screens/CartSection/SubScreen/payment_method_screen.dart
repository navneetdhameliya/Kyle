import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/common_product_details_appbar.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

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
              const CommonProductDetailsAppBar(title: "PAYMENT METHOD"),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    ...List.generate(
                      controller.paymentMethodDataList.length,
                      (index) {
                        final data = controller.paymentMethodDataList[index];
                        return GestureDetector(
                          onTap: (){
                            controller.selectedPaymentMethod.value = index;
                            controller.update([ControllerId.cartKey]);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.all(6),
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: controller.selectedPaymentMethod.value == index ? ColorConstants.commonYellow : ThemeColors.cardBgColor(context),
                              boxShadow: [
                                BoxShadow(color: ThemeColors.shadow(context).withOpacity(.12),blurRadius: 30)
                              ]
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
                                  child: data.image.contains(".svg")
                                      ? SvgPicture.asset(data.image,height: 20,width: 20,)
                                      : Image.asset(
                                    data.image,
                                    height: 16,
                                    width: 24,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: HeadlineBodyOneBaseWidget(
                                    title: data.name,
                                    fontSize: 12,
                                    fontFamily: FontConstant.blinkerRegular,
                                    titleColor: controller.selectedPaymentMethod.value == index ? Colors.black : ThemeColors.primaryText(context),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: controller.selectedPaymentMethod.value == index ? Colors.white : null,
                                    border: Border.all(color: controller.selectedPaymentMethod.value == index ? Colors.white : ThemeColors.secondary(context),),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 14),
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                    CommonButton(title: "Add New Card", onTap: (){},icon: ImageConstants.addIcon,)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
