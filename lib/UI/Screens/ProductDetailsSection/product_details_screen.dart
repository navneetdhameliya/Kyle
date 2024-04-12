import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';
import 'package:kayle/Infrastructure/model/cart_items_data_model.dart';
import 'package:kayle/UI/Commons/common_button.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Commons/square_small_button.dart';
import 'package:kayle/UI/Screens/CartSection/cart_controller.dart';
import 'package:kayle/UI/Screens/HomeSection/widget/product_card.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_controller.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/widgets/review_card.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: ControllerId.productDetailsKey,
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
              appBar(context),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        controller.productImage.value,
                        height: 250,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        HeadlineBodyOneBaseWidget(
                          title: "Fashion",
                          fontSize: 10,
                          fontFamily: FontConstant.blinkerRegular,
                          titleColor: ThemeColors.secondary(context),
                        ),
                        const SizedBox(width: 12),
                        Container(height: 10,width: 1,color: ThemeColors.border(context),),
                        const SizedBox(width: 12),
                        SvgPicture.asset(ImageConstants.starIcon,height: 12,width: 12,),
                        const SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            text: '4.9 ',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: FontConstant.blinkerRegular,
                              color: ThemeColors.primary(context),
                            ),
                            children: [
                              TextSpan(
                                  text: '(10 Reviews)',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: FontConstant.blinkerRegular,
                                  color: ThemeColors.secondary(context),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: HeadlineBodyOneBaseWidget(
                            title: "T-shirt cotton printed",
                            fontSize: 16,
                            fontFamily: FontConstant.blinkerRegular,
                            titleColor: ThemeColors.primary(context),
                          ),
                        ),
                        const SizedBox(width: 16),
                        quantityButton(
                          context: context,
                          icon: ImageConstants.minusIcon,
                          onTap: () {
                            if(controller.quantity.value > 1){
                              controller.quantity.value--;
                              controller.update([ControllerId.productDetailsKey]);
                            }
                          },
                        ),
                        HeadlineBodyOneBaseWidget(
                          title: controller.quantity.value.toString(),
                          fontSize: 14,
                          fontFamily: FontConstant.blinkerRegular,
                          titleColor: ThemeColors.primary(context),
                        ).paddingSymmetric(horizontal: 10),
                        quantityButton(
                          context: context,
                          icon: ImageConstants.addIcon,
                          onTap: () {
                            controller.quantity.value++;
                            controller.update([ControllerId.productDetailsKey]);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    HeadlineBodyOneBaseWidget(
                      title: "\$ ${40.00*controller.quantity.value}",
                      fontSize: 20,
                      fontFamily: FontConstant.blinkerRegular,
                      titleColor: ThemeColors.primary(context),
                    ),
                    const SizedBox(height: 12),
                    HeadlineBodyOneBaseWidget(
                      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum.",
                      fontSize: 10,
                      fontFamily: FontConstant.blinkerRegular,
                      titleColor: ThemeColors.secondary(context),
                    ),
                    const SizedBox(height: 24),
                    HeadlineBodyOneBaseWidget(
                      title: "Color:",
                      fontSize: 10,
                      fontFamily: FontConstant.blinkerRegular,
                      titleColor: ThemeColors.primary(context),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.colorsDataList.length,
                          (index) => GestureDetector(
                            onTap: (){
                              controller.selectedColorIndex.value = index;
                              controller.update([ControllerId.productDetailsKey]);
                            },
                            child: colorCard(
                              context: context,
                              color: controller.colorsDataList[index],
                              selected: controller.selectedColorIndex.value == index,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    HeadlineBodyOneBaseWidget(
                      title: "Size:",
                      fontSize: 10,
                      fontFamily: FontConstant.blinkerRegular,
                      titleColor: ThemeColors.primary(context),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.sizeDataList.length,
                              (index) => GestureDetector(
                            onTap: (){
                              controller.selectedSizeIndex.value = index;
                              controller.update([ControllerId.productDetailsKey]);
                            },
                            child: colorCard(
                              context: context,
                              text: controller.sizeDataList[index],
                              selected: controller.selectedSizeIndex.value == index,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    productDetailsCard(
                      context: context,
                      icon: ImageConstants.infoIcon,
                      title: "Description",
                      onTap: () {
                        Get.toNamed(RoutesConstants.productDescriptionScreen);
                      },
                    ),
                    productDetailsCard(
                      context: context,
                      icon: ImageConstants.messagesIcon,
                      title: "Reviews",
                      onTap: () {
                        Get.toNamed(RoutesConstants.productReviewScreen);
                      },
                    ),
                    const SizedBox(height: 8),
                    const ReviewCard(),
                    const SizedBox(height: 42),
                    brandNameCard(context: context),
                    const SizedBox(height: 32),
                    relatedProduct(context),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(24,18,24,24),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadlineBodyOneBaseWidget(
                            title: "Total Price:",
                            fontSize: 8,
                            fontFamily: FontConstant.blinkerRegular,
                            titleColor: ThemeColors.onSecondary(context),
                          ),
                          HeadlineBodyOneBaseWidget(
                            title: "\$ ${40.00*controller.quantity.value}",
                            fontSize: 24,
                            fontFamily: FontConstant.blinkerRegular,
                            titleColor: ThemeColors.primaryText(context),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CommonButton(
                        title: "Add To Cart",
                        icon: ImageConstants.cartIcon,
                        onTap: () {
                          Get.find<CartController>().cartItemDataList.add(
                                CartItemsDataModel(
                                  image: controller.productImage.value,
                                  productName: "T-shirt cotton printed",
                                  productPrice: 40.00,
                                  productQuantity: controller.quantity.value,
                                ),
                              );
                          Get.find<CartController>().update([ControllerId.cartKey]);
                          Get.snackbar("", "Item Added To Cart");
                        },
                        buttonColor: ColorConstants.commonYellow,
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

  Widget appBar(BuildContext context){
    return Row(
      children: [
        SquareSmallButton(
          dimension: 24,
          onButtonTap: () => Get.back(),
          imagePath: ImageConstants.backButton,
          iconColor: ThemeColors.primary(context),
        ),
        const Spacer(),
        Row(
          children: [
            SquareSmallButton(
              dimension: 18,
              imagePath: ImageConstants.saveMarkIcon,
              iconColor: ThemeColors.primary(context),
            ),
            const SizedBox(
              width: 12,
            ),
            SquareSmallButton(
              dimension: 18,
              imagePath: ImageConstants.basketIcon,
              iconColor: ThemeColors.primary(context),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: 24,vertical: 20);
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

  Widget colorCard({
    required BuildContext context,
    Color? color,
    required bool selected,
    String? text,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: color != null
              ? selected
                  ? ColorConstants.commonYellow
                  : ColorConstants.transparent
              : ColorConstants.transparent,
        ),
      ),
      child: Container(
        height: 24,
        width: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: color != null
                ? ColorConstants.transparent
                : ThemeColors.border(context),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: text != null
              ? HeadlineBodyOneBaseWidget(
                  title: text,
                  fontSize: 10,
                  titleColor: selected
                      ? ThemeColors.primaryText(context)
                      : ThemeColors.onSecondary(context),
                )
              : selected
                  ? SvgPicture.string('<svg width="10" height="10" viewBox="0 0 10 10" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M4.9 1.11377C2.0208 1.11377 1 2.13457 1 5.01378C1 7.89298 2.0208 8.91378 4.9 8.91378C7.7792 8.91378 8.8 7.89298 8.8 5.01378C8.8 2.13457 7.7792 1.11377 4.9 1.11377Z" fill="#F3D743"/><path d="M4.63648 6.17495L6.53648 4.27655C6.65368 4.15935 6.65368 3.96935 6.53648 3.85215C6.41928 3.73535 6.22928 3.73495 6.11208 3.85215L4.42448 5.53855L3.68808 4.80135C3.57128 4.68495 3.38128 4.68415 3.26368 4.80135C3.14648 4.91855 3.14648 5.10855 3.26368 5.22575L4.21208 6.17495C4.26848 6.23135 4.34488 6.26295 4.42448 6.26295C4.50408 6.26295 4.58008 6.23135 4.63648 6.17495Z" fill="#0F0F0F"/></svg>')
                  : Container(),
        ),
      ),
    );
  }

  Widget productDetailsCard({
    required BuildContext context,
    required String icon,
    required String title,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ThemeColors.onSecondary(context),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SquareSmallButton(
              dimension: 18,
              imagePath: icon,
              iconColor: ThemeColors.onSecondary(context),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: HeadlineBodyOneBaseWidget(
                title: title,
                titleColor: ThemeColors.primaryText(context),
                fontSize: 14,
                fontFamily: FontConstant.blinkerRegular,
              ),
            ),
            SquareSmallButton(
              dimension: 24,
              imagePath: ImageConstants.iosForwardIcon,
              iconColor: ThemeColors.primaryText(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandNameCard({required BuildContext context}){
    return Row(
      children: [
        Container(
          height: 52,
          width: 52,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Get.isDarkMode ? ColorConstants.black : ColorConstants.white,
            boxShadow: [
              BoxShadow(
                color: ThemeColors.shadow(context).withOpacity(.2),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Image.network("https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png",color: Get.isDarkMode ? ColorConstants.white : ColorConstants.blackBg,),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadlineBodyOneBaseWidget(
                title: "Nike",
                fontSize: 14,
                fontFamily: FontConstant.blinkerSemiBold,
                titleColor: ThemeColors.primaryText(context),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    height: 4,
                    width: 4,
                    decoration: const BoxDecoration(
                      color: ColorConstants.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  HeadlineBodyOneBaseWidget(
                    title: "Online",
                    fontSize: 8,
                    fontFamily: FontConstant.blinkerSemiBold,
                    titleColor: ThemeColors.secondary(context),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(9),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConstants.commonYellow,
          ),
          child: SquareSmallButton(
            dimension: 14,
            imagePath: ImageConstants.basketIcon,
            iconColor: ColorConstants.black,
          ),
        ),
      ],
    );
  }

  Widget relatedProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineBodyOneBaseWidget(
          title: "Related Product",
          fontSize: 24,
          fontFamily: FontConstant.blinkerRegular,
          titleColor: ThemeColors.primary(context),
        ),
        const SizedBox(
          height: 24,
        ),
        GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            mainAxisExtent: 200,),
          itemBuilder: (context, index) {
            return ProductCard(image: index % 4 == 0 || index % 4 == 3 ? ImageConstants.menPng : ImageConstants.womenPng);
          },
        ),
        const SizedBox(height: 28),
      ],
    );
  }

}
