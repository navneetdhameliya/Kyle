import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/model/cart_items_data_model.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.data,
    required this.onAddTap,
    required this.onRemoveTap,
  });

  final CartItemsDataModel data;
  final GestureTapCallback onAddTap;
  final GestureTapCallback onRemoveTap;

  @override
  Widget build(BuildContext context) {
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
                  data.image,
                ),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          width: 14,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeadlineBodyOneBaseWidget(
                title: 'Fashion',
                fontSize: 8.0,
              ),
              HeadlineBodyOneBaseWidget(
                title: data.productName,
                fontSize: 12.0,
              ),
              HeadlineBodyOneBaseWidget(
                title: '\$ ${data.productPrice * data.productQuantity}',
                fontSize: 14.0,
                fontFamily: FontConstant.blinkerSemiBold,
              ),
            ],
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 16),
            quantityButton(
              context: context,
              icon: ImageConstants.minusIcon,
              onTap: onRemoveTap,
            ),
            HeadlineBodyOneBaseWidget(
              title: data.productQuantity.toString(),
              fontSize: 14,
              fontFamily: FontConstant.blinkerRegular,
              titleColor: ThemeColors.primary(context),
            ).paddingSymmetric(horizontal: 10),
            quantityButton(
              context: context,
              icon: ImageConstants.addIcon,
              onTap: onAddTap,
            ),
          ],
        ),
      ],
    ).marginOnly(bottom: 8);
  }

  Widget quantityButton({
    required BuildContext context,
    required String icon,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(1000),
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ThemeColors.border(context))
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(ThemeColors.primary(context), BlendMode.srcIn),
        ),
      ),
    );
  }
}
