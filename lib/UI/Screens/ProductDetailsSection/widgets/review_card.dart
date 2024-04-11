import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_controller.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: ControllerId.productDetailsKey,
      init: ProductDetailsController(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Get.isDarkMode ? ColorConstants.black : ColorConstants.white,
            boxShadow: [
              BoxShadow(
                color: ThemeColors.shadow(context).withOpacity(.2),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '4.9 ',
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: FontConstant.blinkerRegular,
                        color: ThemeColors.primary(context),
                      ),
                      children: [
                        TextSpan(
                          text: '/5',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: FontConstant.blinkerRegular,
                            color: ThemeColors.onSecondary(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (index) => SvgPicture.asset(ImageConstants.starIcon),
                        ),
                      ),
                      const SizedBox(height: 6),
                      HeadlineBodyOneBaseWidget(
                        title: "Based On 10 Reviews",
                        fontSize: 10,
                        fontFamily: FontConstant.blinkerRegular,
                        titleColor: ThemeColors.onSecondary(context),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                reverse: true,
                children: List.generate(
                  controller.reviewDataList.length,
                  (index) {
                    return Row(
                      children: [
                        SvgPicture.asset(ImageConstants.starIcon),
                        const SizedBox(width: 2),
                        HeadlineBodyOneBaseWidget(
                          title: (index + 1).toString(),
                          fontSize: 10,
                          fontFamily: FontConstant.blinkerRegular,
                          titleColor: ThemeColors.onSecondary(context),
                        ),
                        Expanded(
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(100),
                            value: controller.reviewDataList[index],
                            color: ColorConstants.commonYellow,
                            backgroundColor: Get.isDarkMode
                                ? ThemeColors.border(context)
                                : const Color(0xFFF6F6F6),
                          ).paddingSymmetric(horizontal: 15),
                        ),
                        SizedBox(
                          width: 24,
                          child: HeadlineBodyOneBaseWidget(
                            title:
                                "${(controller.reviewDataList[index] * 100).toStringAsFixed(0)}%",
                            fontSize: 12,
                            titleTextAlign: TextAlign.end,
                            fontFamily: FontConstant.blinkerRegular,
                            titleColor: ThemeColors.primaryText(context),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 4);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
