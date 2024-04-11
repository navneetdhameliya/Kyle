import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

class CommonProductDetailsAppBar extends StatelessWidget {
  const CommonProductDetailsAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              ImageConstants.backButton,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(ThemeColors.onBackground(context), BlendMode.srcIn),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: ThemeColors.onBackground(context),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: HeadlineBodyOneBaseWidget(
            title: title,
            fontSize: 12.0,
            titleColor: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        Container(width: 22),
      ],
    ).paddingAll(24);
  }
}
