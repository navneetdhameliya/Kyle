import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

class FilterTab extends StatelessWidget {
  const  FilterTab({
    super.key,
    this.isSelected = false,
    this.tabText,
    this.onTap,
  });

  final bool? isSelected;
  final String? tabText;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected! ? ThemeColors.buttonActive : ThemeColors.background(context),
          boxShadow: [BoxShadow(
              color: ThemeColors.shadow(context)
                  .withOpacity(.1),
              blurRadius: 4,
              offset: const Offset(0, 4)),],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        margin: const EdgeInsets.only(right: 16),
        alignment: Alignment.center,
        child: HeadlineBodyOneBaseWidget(
          title: tabText,
          titleColor:
          isSelected! ? ThemeColors.primary(context) : ThemeColors.onSecondary(context),
          fontFamily: FontConstant.blinkerRegular,
          fontSize: 10,
        ),
      ),
    );
  }
}
