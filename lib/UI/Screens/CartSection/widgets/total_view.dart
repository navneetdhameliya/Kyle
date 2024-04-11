import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

class TotalView extends StatelessWidget {
  const TotalView({
    super.key,
    required this.title,
    required this.value,
    this.isTotal = false,
    this.isVoucherAdded = false,
    this.valueColor,
  });

  final String title;
  final double value;
  final bool? isTotal;
  final bool? isVoucherAdded;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isTotal ?? false
            ? RichText(
                text: TextSpan(
                  text: "Total ",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontConstant.blinkerSemiBold,
                    color: ThemeColors.primary(context),
                  ),
                  children: [
                    TextSpan(
                      text: title.split("Total")[1],
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: FontConstant.blinkerRegular,
                        color: ThemeColors.secondary(context),
                      ),
                    ),
                  ],
                ),
              )
            : HeadlineBodyOneBaseWidget(
                title: "$title:",
                fontSize: 12,
                fontFamily: FontConstant.blinkerRegular,
                titleColor: ThemeColors.primaryText(context),
              ),
        HeadlineBodyOneBaseWidget(
          title:
              "${isVoucherAdded ?? false ? "-" : ""}\$${value.toStringAsFixed(2)}",
          fontSize: 14,
          fontFamily: FontConstant.blinkerSemiBold,
          titleColor: valueColor ??
              (isTotal ?? false
                  ? ColorConstants.commonYellow
                  : isVoucherAdded ?? false ? ColorConstants.red : ThemeColors.primaryText(context)),
        ),
      ],
    );
  }
}
