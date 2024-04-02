import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    this.titleColor,
    this.buttonColor,
    required this.onTap,
    this.loader,
    this.borderColor,
    this.icon,
    this.iconColor,
    this.fontSize,
    this.radius,
    this.secondIcon,
  });

  final String title;
  final String? icon;
  final String? secondIcon;
  final Color? titleColor;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? iconColor;
  final bool? loader;
  final double? fontSize;
  final double? radius;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CommonInkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: loader == true ? 8 : 12, horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            boxShadow: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? []
                : [BoxShadow(color: ThemeColors.primary(context).withOpacity(0.1), blurRadius: 25, offset: const Offset(0, 4), spreadRadius: 1)],
        border: Border.all(color: borderColor ?? Colors.transparent, width: 1.5),
          color: buttonColor ?? ThemeColors.inversePrimary(context),
          borderRadius: BorderRadius.circular(radius ?? 25),
        ),
        child: loader ?? false
            ? const SizedBox(
                height: 32,
                width: 32,
                child: CircularProgressIndicator(
                  color: ColorConstants.commonYellow,
                )
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    SvgPicture.asset(
                      icon!,
                      color: iconColor,
                    ),
                    const SizedBox(width: 13),
                  ],
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: HeadlineBodyOneBaseWidget(
                      title: title,
                      style: TextStyleConstant.commonStyle(
                          context: context,
                          fontSize: fontSize ?? 14,
                          color: titleColor ?? ThemeColors.primary(context),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
