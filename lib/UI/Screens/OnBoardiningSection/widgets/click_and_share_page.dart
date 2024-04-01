import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/font_constant.dart';
import 'package:kayle/UI/Widgets/fade_in_file_image_widget.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16,),
          DelayedDisplay(
            slideIn: true,
            fadingDuration: const Duration(milliseconds: 500),
            slidingBeginOffset: const Offset(0, .7),

            child: Container(
              padding: const EdgeInsets.only(top: 42,left: 20),
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Click ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: FontConstant.blinker,
                        height: 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const TextSpan(
                      text: 'and\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontFamily: FontConstant.blinker,
                        height: 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),


                    const TextSpan(
                      text: ' ✈️',
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
          const SizedBox(height: 12,),
          DelayedDisplay(
            slideIn: true,
            fadingDuration: const Duration(milliseconds: 500),
            slidingBeginOffset: const Offset(0, 3),
            delay: const Duration(milliseconds: 200),
            child: SizedBox(
              width: 351,
              child: Text(
                'With one click, you can share your post on any social media platform.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                  fontFamily: FontConstant.blinker,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24,),
          Expanded(
            child: DelayedDisplay(
              slideIn: true,
              fadingDuration: const Duration(milliseconds: 750),
              delay: const Duration(milliseconds: 50),
              slidingBeginOffset: const Offset(0, 1),
              child: SizedBox(
                // width: double.infinity,
                width: MediaQuery.of(context).size.width-24,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.asset(
                  widget.fileUrl,
                  fit: BoxFit.contain,
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
