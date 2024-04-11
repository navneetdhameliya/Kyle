import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';

class CommonMainAppBar extends StatelessWidget {
  const CommonMainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 36,
            width: 36,
            child: Image.asset(ImageConstants.coloredLogoPng),
        ),
        const Spacer(),
        Row(
          children: [
            SvgPicture.asset(
              ImageConstants.searchIcon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(ThemeColors.primary(context), BlendMode.srcIn),
            ),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(RoutesConstants.notificationScreen),
              child: SvgPicture.asset(
                ImageConstants.notificationIcon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(ThemeColors.primary(context), BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
