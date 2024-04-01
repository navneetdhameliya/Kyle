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
          Expanded(
            child: DelayedDisplay(
              slideIn: false,
              fadingDuration: const Duration(milliseconds: 750),
              delay: const Duration(milliseconds: 50),
              slidingBeginOffset: const Offset(0, 1),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  widget.fileUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;
}
