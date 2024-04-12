import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';

import 'color_constant.dart';

class ConstantTheme {
  static ThemeData lightTheme = ThemeData(
      // primaryColor: Colors.black,
      // scaffoldBackgroundColor: Colors.white,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorConstants.black,
        //primaryText
        background: ColorConstants.whiteBg,
        //primarySurface
        secondary: ColorConstants.whiteSecondary,
        //secondaryText
        onSecondary: ColorConstants.blackSecondary,
        // line color
        inversePrimary: ColorConstants.white,
        onBackground: ColorConstants.blackBg,
        inverseSurface: ColorConstants.whiteBg,
        shadow: const Color(0xffA69426),
        surface: ColorConstants.white, //card
        // onPrimary: ColorConstants.grey, //iconPrimary
        // primaryContainer: ColorConstants.whiteSecondary, //iconInActive
        onPrimaryContainer: const Color(0xFFE4E4E4), //border
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: ColorConstants.blackBg,
      ),
      bottomSheetTheme: const BottomSheetThemeData(),
      // appBarTheme: const AppBarTheme(
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       // Status bar color
      //       statusBarColor: ColorConstants.white,
      //       statusBarBrightness: Brightness.dark,
      //       statusBarIconBrightness: Brightness.dark,
      //     ),
      // ),
      useMaterial3: true,
      fontFamily: FontConstant.blinkerThin);

  static ThemeData darkTheme = ThemeData(
      // primaryColor: Colors.white,
      // scaffoldBackgroundColor: Colors.black,
      useMaterial3: true,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: ColorConstants.white,
        //primaryText
        background: ColorConstants.blackBg,
        //primarySurface
        secondary: ColorConstants.blackSecondary,
        //secondaryText
        onSecondary: ColorConstants.whiteSecondary,
        // line color
        inversePrimary: ColorConstants.black2a2a,
        onBackground: ColorConstants.whiteBg,
        inverseSurface: ColorConstants.blackBg,
        shadow: ColorConstants.blackBg.withOpacity(.2),
        surface: ColorConstants.black1E, //card
        // onPrimary: ColorConstants.white, //iconPrimary
        // primaryContainer: ColorConstants.white, //iconInActive
        onPrimaryContainer: const Color(0xFF717171), //border
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: ColorConstants.whiteBg,
      ),
      // appBarTheme: const AppBarTheme(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     // Status bar color
      //     statusBarColor: ColorConstants.black,
      //     statusBarBrightness: Brightness.light,
      //     statusBarIconBrightness: Brightness.light,
      //   ),
      // ),
      fontFamily: FontConstant.blinkerThin);
}
