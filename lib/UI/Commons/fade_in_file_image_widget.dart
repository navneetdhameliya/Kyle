import 'dart:async';

import 'package:flutter/material.dart';

class DelayedDisplay extends StatefulWidget {
  final Widget child;

  final Duration delay;

  final Duration fadingDuration;
  final Duration slideDuration;

  final Curve slidingCurve;

  final Offset slidingBeginOffset;

  final bool fadeIn;
  final bool slideIn;

  const DelayedDisplay({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.fadingDuration = const Duration(milliseconds: 300),
    this.slideDuration = const Duration(milliseconds: 300),
    this.slidingCurve = Curves.decelerate,
    this.slidingBeginOffset = const Offset(0.0, 0.35),
    this.fadeIn = true,
    this.slideIn = false,
  });

  @override
  createState() => _DelayedDisplayState();
}

class _DelayedDisplayState extends State<DelayedDisplay>
    with TickerProviderStateMixin {
  late AnimationController _opacityController;
  late AnimationController _slideController;

  late Animation<Offset> _slideAnimationOffset;

  Timer? _timer;

  Duration get delay => widget.delay;

  Duration get opacityTransitionDuration => widget.fadingDuration;

  Duration get slideTransitionDuration => widget.slideDuration;

  Curve get slidingCurve => widget.slidingCurve;

  Offset get beginOffset => widget.slidingBeginOffset;

  bool get fadeIn => widget.fadeIn;

  bool get slideIn => widget.slideIn;

  @override
  void initState() {
    super.initState();

    _opacityController = AnimationController(
      vsync: this,
      duration: opacityTransitionDuration,
    );

    _slideController = AnimationController(
      vsync: this,
      duration: slideTransitionDuration,
    );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      curve: slidingCurve,
      parent: _slideController,
    );

    _slideAnimationOffset = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(curvedAnimation);

    _runFadeAnimation();
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _slideController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didUpdateWidget(DelayedDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fadeIn == fadeIn) {
      return;
    }
    _runFadeAnimation();
  }

  void _runFadeAnimation() {
    _timer = Timer(delay, () {
      fadeIn ? _opacityController.forward() : _opacityController.reverse();
      slideIn ? _slideController.forward() : _slideController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return fadeIn
        ? FadeTransition(
            opacity: _opacityController,
            child: slideIn
                ? SlideTransition(
                    position: _slideAnimationOffset,
                    child: widget.child,
                  )
                : widget.child,
          )
        : slideIn
            ? SlideTransition(
                position: _slideAnimationOffset,
                child: widget.child,
              )
            : widget.child;
  }
}
