import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/UI/Commons/common_inkwell.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: false,
      elevation: 0,
      backgroundColor: ThemeColors.background(context),
      automaticallyImplyLeading: false,
      title: CommonInkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
              margin: const EdgeInsets.only(left: 5),
              child: SvgPicture.asset(ImageConstants.backButton,
                  colorFilter: ColorFilter.mode(
                      ThemeColors.primary(context), BlendMode.srcIn)))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
