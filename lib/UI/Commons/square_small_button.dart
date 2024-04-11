import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';

class SquareSmallButton extends StatelessWidget {
  const SquareSmallButton({
    super.key,
    required this.dimension,
    required this.imagePath,
    this.onButtonTap,
    required this.iconColor,
    this.backGroundColor,
    this.paddingDimension = 0.0,
  });

  final double dimension;
  final double paddingDimension;
  final String imagePath;
  final Color iconColor;
  final Color? backGroundColor;
  final GestureTapCallback? onButtonTap;


  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: onButtonTap,
     splashColor: ColorConstants.transparent,
     focusColor: ColorConstants.transparent,
     highlightColor: ColorConstants.transparent,
     hoverColor: ColorConstants.transparent,
     child: Container(
       color: backGroundColor ?? ColorConstants.transparent,
       width: dimension,
       height: dimension,
       child: Padding(
         padding: EdgeInsets.all(paddingDimension),
         child: Center(
           child: SvgPicture.asset(
              imagePath,
              width: dimension,
              height: dimension,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
       ),
     ),
   );
  }

}