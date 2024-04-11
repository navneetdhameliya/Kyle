import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/ProductDetailsSection/product_details_controller.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.data});

  final UserReviewDataModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 9),
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
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.asset(
                  data.image,
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadlineBodyOneBaseWidget(
                      title: data.name,
                      fontSize: 10,
                      titleColor: ThemeColors.primaryText(context),
                    ),
                    HeadlineBodyOneBaseWidget(
                      title: data.time,
                      fontSize: 8,
                      titleColor: ThemeColors.secondary(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Row(
                children: List.generate(
                  5,
                  (index) => data.rate < index
                      ? Image.asset(
                    ImageConstants.unfilledStarImg,
                    height: 12,
                    width: 12,
                  )
                      : SvgPicture.asset(
                    ImageConstants.starIcon,
                    height: 12,
                    width: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          HeadlineBodyOneBaseWidget(
            title: data.review,
            fontSize: 10,
            titleTextAlign: TextAlign.start,
            titleColor: ThemeColors.secondary(context),
          ),
        ],
      ),
    );
  }
}
