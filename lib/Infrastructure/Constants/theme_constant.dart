import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';

import 'color_constant.dart';

class ConstantTheme{
  static ThemeData lightTheme = ThemeData(
    // primaryColor: Colors.black,
    // scaffoldBackgroundColor: Colors.white,
      pageTransitionsTheme:  const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      colorScheme: const ColorScheme.light().copyWith(
        background: ColorConstants.whiteBg, //primarySurface
        primary: ColorConstants.black, //primaryText
        secondary: ColorConstants.whiteSecondary, //secondaryText
        surface: ColorConstants.greyLight, //surfaceAlt
        onSecondary: ColorConstants.blackSecondary, // line color
        inversePrimary: ColorConstants.white,
        onPrimary: ColorConstants.grey, //iconPrimary
        primaryContainer: ColorConstants.whiteSecondary, //iconInActive
        onPrimaryContainer: ColorConstants.grey4, //border
      ),
      dialogTheme: const DialogTheme(
        // backgroundColor: ColorConstants.white,

      ),
      bottomSheetTheme: const BottomSheetThemeData(

      ),
      // appBarTheme: const AppBarTheme(
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       // Status bar color
      //       statusBarColor: ColorConstants.white,
      //       statusBarBrightness: Brightness.dark,
      //       statusBarIconBrightness: Brightness.dark,
      //     ),
      // ),
      useMaterial3: true,
      fontFamily: FontConstant.blinkerThin
  );

  static ThemeData darkTheme = ThemeData(
    // primaryColor: Colors.white,
    // scaffoldBackgroundColor: Colors.black,
      useMaterial3: true,
      pageTransitionsTheme:  const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      colorScheme: const ColorScheme.dark().copyWith(
        background: ColorConstants.blackBg, //primarySurface
        primary: ColorConstants.white, //primaryText
        onSecondary: ColorConstants.whiteSecondary, // line color
        secondary: ColorConstants.blackSecondary, //secondaryText
        surface: ColorConstants.blackAlt, //surfaceAlt
        onPrimary: ColorConstants.white, //iconPrimary
        primaryContainer: ColorConstants.white, //iconInActive
        inversePrimary: ColorConstants.black2a2a,
        onPrimaryContainer: ColorConstants.greyAlt, //border
      ),

      dialogTheme: const DialogTheme(
        backgroundColor: ColorConstants.blackAlt,
      ),
      // appBarTheme: const AppBarTheme(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     // Status bar color
      //     statusBarColor: ColorConstants.black,
      //     statusBarBrightness: Brightness.light,
      //     statusBarIconBrightness: Brightness.light,
      //   ),
      // ),
      fontFamily: FontConstant.blinkerThin
  );
}