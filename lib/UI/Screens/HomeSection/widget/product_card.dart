import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(RoutesConstants.productDetailsScreen,arguments: [image]);
      },
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
                      image: AssetImage(image),
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
                    colorFilter: ColorFilter.mode(
                        ThemeColors.primary(context),
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                  color: Get.isDarkMode ? ColorConstants.black : ColorConstants.white,
                  boxShadow: [
                    BoxShadow(
                        color: ThemeColors.shadow(context).withOpacity(.2),
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
                      titleColor:
                      ThemeColors.onSecondary(context),
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
  }
}
