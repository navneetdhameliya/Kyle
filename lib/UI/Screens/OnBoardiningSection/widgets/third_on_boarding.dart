import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/app_constants.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Commons/fade_in_file_image_widget.dart';

class ThirdOnBoarding extends StatefulWidget {
  final String fileUrl;
  const ThirdOnBoarding({super.key, required this.fileUrl});

  @override
  State<ThirdOnBoarding> createState() => _ThirdOnBoardingState();
}

class _ThirdOnBoardingState extends State<ThirdOnBoarding> with SingleTickerProviderStateMixin , AutomaticKeepAliveClientMixin{
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DelayedDisplay(
            slideIn: false,
            fadingDuration: const Duration(milliseconds: 750),
            delay: const Duration(milliseconds: 50),
            slidingBeginOffset: const Offset(0, 1),
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    widget.fileUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(top: 13, left: 25, child: SafeArea(child: Image.asset(ImageConstants.coloredLogoPng,width: 36,height: 36,)))
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DelayedDisplay(
                  slideIn: true,
                  slideDuration: const Duration(milliseconds: 750),
                  delay: const Duration(milliseconds: 50),
                  slidingBeginOffset: const Offset(0, .2),
                  child: Image.asset(
                    ImageConstants.onboardingOThreeBG,
                    fit: BoxFit.contain,
                  ).paddingOnly(top: 4),
                ),
              ),
              HeadlineBodyOneBaseWidget(
                title: AppConstants.eCom.tr,
                fontSize: 14,
                fontFamily: FontConstant.blinkerRegular,
                titleColor: const Color(0xffBDBDBD),
              ),
              const SizedBox(
                height: 8,
              ),
              HeadlineBodyOneBaseWidget(
                title: AppConstants.onBoardingThirdTitle.tr,
                fontSize: 50,
                fontFamily: FontConstant.blinkerRegular,
                titleColor: ThemeColors.primary(context),
              ),

              const SizedBox(
                height: 16,
              ),
              HeadlineBodyOneBaseWidget(
                title:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                fontSize: 14,
                fontFamily: FontConstant.blinkerRegular,
                titleColor: ThemeColors.primary(context).withOpacity(.6),
              ),
              const SizedBox(
                height: 26,
              ),
            ],
          ).paddingSymmetric(horizontal: 24,vertical: 48),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
