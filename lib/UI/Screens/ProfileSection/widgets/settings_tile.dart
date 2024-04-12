import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/ProfileSection/profile_controller.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.dataList,
  });

  final String title;
  final List<SettingItemModel> dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadlineBodyOneBaseWidget(
          title: title,
          fontSize: 12,
          titleColor: ThemeColors.onSecondary(context),
        ).paddingSymmetric(horizontal: 24,vertical: 12),
        ListView.builder(
          itemCount: dataList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemBuilder: (context, index) {
            final data = dataList[index];
            return Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              decoration: BoxDecoration(
                color: ThemeColors.inversePrimary(context),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(index == 0 ? 10 : 0),
                  bottom: Radius.circular(index == (dataList.length - 1) ? 10 : 0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ThemeColors.shadow(context).withOpacity(.12),
                    blurRadius: 30,
                    offset: const Offset(0,6),
                  )
                ]
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: SvgPicture.asset(
                      data.icon,
                      colorFilter: ColorFilter.mode(
                        ThemeColors.primary(context),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  HeadlineBodyOneBaseWidget(
                    title: data.name,
                    fontSize: 12,
                    titleColor: ThemeColors.primary(context),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    ImageConstants.rightArrowIcon,
                    colorFilter: ColorFilter.mode(
                      ThemeColors.primary(context),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
