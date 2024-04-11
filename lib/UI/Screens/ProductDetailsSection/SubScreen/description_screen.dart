import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_controller.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/common_product_details_appbar.dart';

class ProductDescriptionScreen extends StatelessWidget {
  const ProductDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: ControllerId.productDescriptionScreenKey,
      init: ProductDetailsController(),
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
              const CommonProductDetailsAppBar(title: "DESCRIPTION"),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    const SizedBox(height: 12),
                    HeadlineBodyOneBaseWidget(
                      title: "Information",
                      fontSize: 14,
                      titleColor: ThemeColors.primaryText(context),
                    ),
                    const SizedBox(height: 8),
                    HeadlineBodyOneBaseWidget(
                      title:
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Cursus metus aliquam eleifend mi in nulla posuere. Purus in mollis nunc sed id. Pellentesque id nibh tortor id aliquet lectus.

Amet commodo nulla facilisi nullam vehicula. In dictum non consectetur a erat nam at lectus urna. Vulputate sapien nec sagittis aliquam malesuada bibendum''',
                      fontSize: 10,
                      titleColor: ThemeColors.secondary(context),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 1,
                      width: double.maxFinite,
                      color: ThemeColors.border(context),
                    ),
                    const SizedBox(height: 24),
                    HeadlineBodyOneBaseWidget(
                      title: "Material",
                      fontSize: 14,
                      titleColor: ThemeColors.primaryText(context),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        controller.materialDetails.length,
                        (index) => Row(
                          children: [
                            Container(
                              height: 1.5,
                              width: 1.5,
                              color: ThemeColors.secondary(context),
                            ),
                            const SizedBox(width: 4),
                            HeadlineBodyOneBaseWidget(
                              title: controller.materialDetails[index],
                              fontSize: 10,
                              titleColor: ThemeColors.secondary(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(ImageConstants.descriptionVideoImg),
                        ),
                        SvgPicture.asset(ImageConstants.playIcon),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: List.generate(
                        controller.descriptionImages.length,
                        (index) => Image.asset(
                          controller.descriptionImages[index],
                          height: 18,
                          width: 18,
                        ).marginOnly(right: 12),
                      ),
                    ),
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
