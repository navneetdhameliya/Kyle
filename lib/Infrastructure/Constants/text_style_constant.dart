import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';

class TextStyleConstant  {


  static commonStyle({required BuildContext context,double? fontSize,FontWeight ?fontWeight,Color ?color}){

    return GoogleFonts.blinker(
        textStyle: TextStyle( fontSize:fontSize?? 32,
        color:color?? ThemeColors.primaryText(context),
    fontWeight:fontWeight?? FontWeight.w300));
  }

}
