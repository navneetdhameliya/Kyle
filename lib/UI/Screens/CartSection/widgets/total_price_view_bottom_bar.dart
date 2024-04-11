import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
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
                                  title: "Use Voucher",
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
                          const TotalView(title: "Shipping", value: 15.00),
                          if(controller.voucherAdded.value)
                          const TotalView(title: "Voucher", value: 12.00,isVoucherAdded: true,),
                          Container(
                            height: 1,
                            width: double.maxFinite,
                            color: ThemeColors.border(context),
                            margin: const EdgeInsets.symmetric(vertical: 20),
                          ),
                          TotalView(
                            title: "Total (${controller.cartItemDataList.length} items)",
                            value: (controller.totalPrice.value + 15.00) - (controller.voucherAdded.value ? 12.00 : 0.0),
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
