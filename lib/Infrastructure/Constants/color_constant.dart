import 'package:flutter/material.dart';

class ColorConstants {
  static const Color whiteBg = Color(0xFFFFFDF6);
  static const Color blackBg = Color(0xFF0f0f0f);
  static const Color white = Colors.white;
  static const Color black = Color(0xFF2D2D2D);
  static const Color black2a2a = Color(0xFF2a2a2a);
  static const Color blackSecondary = Color(0xFFBDBDBD);
  static const Color whiteSecondary = Color(0xFF717171);
  static const Color commonYellow = Color(0xFFF3D743);


  static const Color blackText = Color(0xFF0E0E0E);
  static const Color transparent = Colors.transparent;
  static const Color grey = Color(0xFF828596);//Color(0xff6D6D6D);
  static const Color greyAlt = Color(0xff222325);//Color(0xFF2C2E32);
  static const Color blackAlt = Color(0xFF17181B);//Color(0xFF2C2E32);//Color(0xff17181B);
  static const Color blue = Color(0xff1855F4);
  static const Color green = Color(0xff00B012);
  static const Color red = Color(0xffDD0000);
  static const Color yellow = Color(0xffEA9803);
  static const Color yellow43 = Color(0xffF3D743);
  static const Color greyLight = Color(0xFFF3F6FE);//Color(0xffF9F9FF);//F9F9FF//F1F1FF
  static const Color grey4 = Color(0xFFECECFF);//Color(0xffDFDFFF);
  static const Color pink = Color(0xffDB00FF);//Color(0xFF5F6989)
}

class ThemeColors {

  // static Color primary(BuildContext context) => Theme.of(context).colorScheme.primary;
  // static Color primaryText = isDark ? ColorConstants.white : ColorConstants.black;
  static Color primaryText(BuildContext context) => Theme.of(context).colorScheme.primary;
  static Color secondaryText(BuildContext context) => Theme.of(context).colorScheme.secondary;
  static Color primarySurface(BuildContext context) => Theme.of(context).colorScheme.background;
  static Color surfaceAlt(BuildContext context) => Theme.of(context).colorScheme.surface;
  static Color lineColor(BuildContext context) => Theme.of(context).colorScheme.onSecondary;
  static Color emotionPositive = ColorConstants.green;
  static Color emotionNegative = ColorConstants.red;
  static Color emotionNeutral = ColorConstants.yellow;
  static Color iconActive = ColorConstants.blue;
  static Color buttonActive = ColorConstants.yellow43;
  static Color buttonText = ColorConstants.black;
  // static Color iconPrimary(BuildContext context) => isDark ? ColorConstants.white : ColorConstants.grey;
  static Color iconPrimary(BuildContext context) => Theme.of(context).colorScheme.onPrimary;
  // static Color iconInActive = isDark ? ColorConstants.white : ColorConstants.grey5;
  static Color iconInActive(BuildContext context) => Theme.of(context).colorScheme.primaryContainer;
  static Color whiteTextField(BuildContext context) => Theme.of(context).colorScheme.inversePrimary;
  static Color border(BuildContext context) => Theme.of(context).colorScheme.onPrimaryContainer;
  static Color link = ColorConstants.blue;
}
