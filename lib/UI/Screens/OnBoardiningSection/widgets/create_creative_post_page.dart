import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/UI/Widgets/fade_in_file_image_widget.dart';

class FirstOnBoarding extends StatefulWidget {
  final String fileUrl;

  const FirstOnBoarding({
    super.key,
    required this.fileUrl,
  });

  @override
  State<FirstOnBoarding> createState() => _FirstOnBoardingState();
}

class _FirstOnBoardingState extends State<FirstOnBoarding>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          DelayedDisplay(
            slideIn: true,
            fadingDuration: const Duration(milliseconds: 500),
            slidingBeginOffset: const Offset(0, .7),
            child: Container(
              padding: const EdgeInsets.only(top: 42),
              alignment: Alignment.centerLeft,
              width: 351,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Create\n',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontFamily: FontConstant.blinker,
                          fontWeight: FontWeight.w700,
                          height: 1),
                    ),
                    const TextSpan(
                      text: ' Post😍',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: FontConstant.blinker,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          DelayedDisplay(
            slideIn: true,
            fadingDuration: const Duration(milliseconds: 500),
            slidingBeginOffset: const Offset(0, 3),
            delay: const Duration(milliseconds: 200),
            child: SizedBox(
              width: 351,
              child: Text(
                'You can create amazing Text Posts & Stories, Quotes and Review post for all social media platforms.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: FontConstant.blinker,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: DelayedDisplay(
              slideIn: true,
              fadingDuration: const Duration(milliseconds: 750),
              delay: const Duration(milliseconds: 50),
              slidingBeginOffset: const Offset(0, 1),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    widget.fileUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
