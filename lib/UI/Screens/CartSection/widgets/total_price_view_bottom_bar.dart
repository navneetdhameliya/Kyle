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
import 'package:kayle/UI/Screens/CartSection/widgets/total_view.dart';

class TotalPriceViewBottomBar extends StatelessWidget {
  const TotalPriceViewBottomBar({
    super.key,
    required this.buttonText,
    required this.onTap,
  });

  final String buttonText;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      id: ControllerId.cartKey,
      builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: ColorConstants.lightYellow,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.voucherAdded.value = true;
                        controller.update([ControllerId.cartKey]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 18),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: SvgPicture.asset(
                                    ImageConstants.voucherIcon,
                                    colorFilter: ColorFilter.mode(
                                        ThemeColors.primary(context), BlendMode.srcIn),
                                  ),
                                ).paddingOnly(right: 8),
                                HeadlineBodyOneBaseWidget(
                                  title: controller.voucherAdded.value ? "1 Voucher Used" : "Use Voucher",
                                  fontSize: 12,
                                  titleColor: ThemeColors.primary(context),
                                ),
                              ],
                            ),
                            controller.voucherAdded.value
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(200),
                                          border: Border.all(color: ColorConstants.green),
                                      ),
                                      child: const HeadlineBodyOneBaseWidget(
                                        title: "Discount 10%",
                                        fontSize: 8,
                                        fontFamily: FontConstant.blinkerRegular,
                                        titleColor: ColorConstants.green,
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      ImageConstants.rightArrowIcon,
                                      colorFilter: ColorFilter.mode(
                                          ThemeColors.primary(context),
                                          BlendMode.srcIn,
                                      ),
                                    ),
                            ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 34),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? const Color(0xFF2D2D2D) : Colors.white,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          TotalView(title: "Subtotal", value: controller.totalPrice.value),
                          TotalView(title: "Shipping", value: controller.cartItemDataList.length * 5.00),
                          if(controller.voucherAdded.value)
                            TotalView(title: "Voucher", value: controller.totalPrice.value * .1,isVoucherAdded: true,),
                          Container(
                            height: 1,
                            width: double.maxFinite,
                            color: ThemeColors.border(context),
                            margin: const EdgeInsets.symmetric(vertical: 20),
                          ),
                          TotalView(
                            title: "Total (${controller.cartItemDataList.length} items)",
                            value: (controller.totalPrice.value + controller.cartItemDataList.length * 5.00) - (controller.voucherAdded.value ? controller.totalPrice.value * .1 : 0.0),
                            isTotal: true,
                          ),
                          const SizedBox(height: 30),
                          CommonButton(
                            title: buttonText,
                            onTap: onTap,
                            buttonColor: ColorConstants.commonYellow,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    },);
  }
}
