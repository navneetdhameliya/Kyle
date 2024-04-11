import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Commons/square_small_button.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_controller.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/common_product_details_appbar.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/review_card.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: ControllerId.productReviewScreenKey,
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
              const CommonProductDetailsAppBar(title: "REVIEW"),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    const ReviewCard(),
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: (){
                        Get.toNamed(RoutesConstants.addReviewScreen);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
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
                        child: Row(
                          children: [
                            SquareSmallButton(
                              dimension: 18,
                              imagePath: ImageConstants.messagesIcon,
                              iconColor: ThemeColors.secondary(context),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: HeadlineBodyOneBaseWidget(
                                title: "Add A Review",
                                titleColor: ThemeColors.secondary(context),
                                fontSize: 14,
                              ),
                            ),
                            SquareSmallButton(
                              dimension: 16,
                              imagePath: ImageConstants.iosForwardIcon,
                              iconColor: ThemeColors.primary(context),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 44),
                    Row(
                      children: [
                        Expanded(
                          child: HeadlineBodyOneBaseWidget(
                            title: "User Reviews",
                            fontSize: 14,
                            titleColor: ThemeColors.primaryText(context),
                            fontFamily: FontConstant.blinkerSemiBold,
                          ),
                        ),

                        SquareSmallButton(
                          dimension: 14,
                          imagePath: ImageConstants.filterIcon,
                          iconColor: ThemeColors.secondary(context),
                        ),
                        const SizedBox(width: 6),
                        HeadlineBodyOneBaseWidget(
                          title: "Sort By",
                          fontSize: 12,
                          titleColor: ThemeColors.primaryText(context),
                          fontFamily: FontConstant.blinkerRegular,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: List.generate(
                        controller.userReviewDataList.length,
                        (index) => UserReviewCard(
                          data: controller.userReviewDataList[index],
                        ),
                      ),
                    ),
                    const SizedBox(height: 42),
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
