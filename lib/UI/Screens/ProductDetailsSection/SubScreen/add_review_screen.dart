import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_text_field.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_controller.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/common_product_details_appbar.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({super.key});

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
              const CommonProductDetailsAppBar(title: "ADD A REVIEW"),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            ImageConstants.menPng,
                            height: 62,
                            width: 62,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadlineBodyOneBaseWidget(
                                title: "Fashion",
                                fontSize: 10,
                                fontFamily: FontConstant.blinkerRegular,
                                titleColor: ThemeColors.secondary(context),
                              ),
                              HeadlineBodyOneBaseWidget(
                                title: "T-shirt cotton printed",
                                fontSize: 16,
                                fontFamily: FontConstant.blinkerRegular,
                                titleColor: ThemeColors.primary(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Container(
                      height: 1,
                      width: double.maxFinite,
                      color: ThemeColors.border(context),
                    ),
                    const SizedBox(height: 28),
                    HeadlineBodyOneBaseWidget(
                      title: "Your rating for this product",
                      fontSize: 10,
                      titleTextAlign: TextAlign.center,
                      fontFamily: FontConstant.blinkerRegular,
                      titleColor: ThemeColors.secondary(context),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                            (index) => GestureDetector(
                          onTap: () {
                            controller.selectedStarIndex.value = index;
                            controller.update([ControllerId.productReviewScreenKey]);
                          },
                          child: controller.selectedStarIndex.value < index
                              ? Image.asset(
                                  ImageConstants.unfilledStarImg,
                                  height: 34,
                                  width: 34,
                                )
                              : SvgPicture.asset(
                                  ImageConstants.starIcon,
                                  height: 34,
                                  width: 34,
                                ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),
                    Container(
                      height: 1,
                      width: double.maxFinite,
                      color: ThemeColors.border(context),
                    ),
                    const SizedBox(height: 30),
                    HeadlineBodyOneBaseWidget(
                      title: "Add A Review",
                      fontSize: 24,
                      fontFamily: FontConstant.blinkerRegular,
                      titleColor: ThemeColors.primaryText(context),
                    ),
                    const SizedBox(height: 20),

                    commonTextField(context: context, hint: "Title", controller: controller.reviewTitleController.value,borderRadius: 10),

                    const SizedBox(height: 12),

                    commonTextField(context: context, hint: "Message", controller: controller.reviewMessageController.value,borderRadius: 10,maxLine: 5,minLine: 5),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonButton(
                title: "Submit Review",
                onTap: () {
                  controller.userReviewDataList.add(
                    UserReviewDataModel(
                      image: ImageConstants.menPng,
                      time: "a moment ago",
                      name: "John Wick",
                      review: "${controller.reviewTitleController.value.text}\n${controller.reviewMessageController.value.text}",
                      rate: controller.selectedStarIndex.value,
                    ),
                  );
                  controller.selectedStarIndex.value = 3;
                  controller.reviewTitleController.value.clear();
                  controller.reviewMessageController.value.clear();
                  controller.update([ControllerId.productReviewScreenKey]);
                  Get.back();
                },
                buttonColor: ColorConstants.commonYellow,
              ).paddingAll(25),
            ],
          ),
        );
      },
    );
  }
}
