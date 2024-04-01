import 'package:flutter/material.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/indicator/expanding_dots_effect.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/indicator/indicator_effect.dart';

typedef OnDotClicked = void Function(int index);

class SmoothPageIndicator extends StatefulWidget {
  final PageController controller;

  final IndicatorEffect effect;

  final Axis axisDirection;

  final int count;

  final TextDirection? textDirection;

  final OnDotClicked? onDotClicked;

  const SmoothPageIndicator({
    super.key,
    required this.controller,
    required this.count,
    this.axisDirection = Axis.horizontal,
    this.textDirection,
    this.onDotClicked,
    this.effect = const ExpandingDotsEffect(),
  });

  @override
  State<SmoothPageIndicator> createState() => _SmoothPageIndicatorState();
}

mixin _SizeAndRotationCalculatorMixin {
  late Size size;

  int quarterTurns = 0;

  BuildContext get context;

  TextDirection? get textDirection;

  Axis get axisDirection;

  int get count;

  IndicatorEffect get effect;

  void updateSizeAndRotation() {
    size = effect.calculateSize(count);

    final isRTL = (textDirection ?? _getDirectionality()) == TextDirection.rtl;
    if (axisDirection == Axis.vertical) {
      quarterTurns = 1;
    } else {
      quarterTurns = isRTL ? 2 : 0;
    }
  }

  TextDirection? _getDirectionality() {
    return context
        .findAncestorWidgetOfExactType<Directionality>()
        ?.textDirection;
  }
}

class _SmoothPageIndicatorState extends State<SmoothPageIndicator>
    with _SizeAndRotationCalculatorMixin {
  @override
  void initState() {
    super.initState();
    updateSizeAndRotation();
  }

  @override
  void didUpdateWidget(covariant SmoothPageIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSizeAndRotation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) => SmoothIndicator(
        offset: _offset,
        count: count,
        effect: effect,
        onDotClicked: widget.onDotClicked,
        size: size,
        quarterTurns: quarterTurns,
      ),
    );
  }

  double get _offset {
    try {
      var offset =
          widget.controller.page ?? widget.controller.initialPage.toDouble();
      return offset % widget.count;
    } catch (_) {
      return widget.controller.initialPage.toDouble();
    }
  }

  @override
  int get count => widget.count;

  @override
  Axis get axisDirection => widget.axisDirection;

  @override
  TextDirection? get textDirection => widget.textDirection;

  @override
  IndicatorEffect get effect => widget.effect;
}

class SmoothIndicator extends StatelessWidget {
  final double offset;

  final IndicatorEffect effect;

  final int count;

  final OnDotClicked? onDotClicked;

  final Size size;

  final int quarterTurns;

  const SmoothIndicator({
    super.key,
    required this.offset,
    required this.count,
    required this.size,
    this.quarterTurns = 0,
    this.effect = const ExpandingDotsEffect(),
    this.onDotClicked,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: GestureDetector(
        onTapUp: _onTap,
        child: CustomPaint(
          size: size,
          // rebuild the painter with the new offset every time it updates
          painter: effect.buildPainter(count, offset),
        ),
      ),
    );
  }

  void _onTap(details) {
    if (onDotClicked != null) {
      var index = effect.hitTestDots(details.localPosition.dx, count, offset);
      if (index != -1 && index != offset.toInt()) {
        onDotClicked?.call(index);
      }
    }
  }
}

class AnimatedSmoothIndicator extends ImplicitlyAnimatedWidget {
  final int activeIndex;

  final IndicatorEffect effect;

  final Axis axisDirection;

  final int count;

  final TextDirection? textDirection;

  final Function(int index)? onDotClicked;

  const AnimatedSmoothIndicator({
    super.key,
    required this.activeIndex,
    required this.count,
    this.axisDirection = Axis.horizontal,
    this.textDirection,
    this.onDotClicked,
    this.effect = const ExpandingDotsEffect(),
    super.curve = Curves.easeInOut,
    super.duration = const Duration(milliseconds: 300),
    super.onEnd,
  });

  @override
  AnimatedWidgetBaseState<AnimatedSmoothIndicator> createState() =>
      _AnimatedSmoothIndicatorState();
}

class _AnimatedSmoothIndicatorState
    extends AnimatedWidgetBaseState<AnimatedSmoothIndicator>
    with _SizeAndRotationCalculatorMixin {
  Tween<double>? _offset;

  @override
  void initState() {
    super.initState();
    updateSizeAndRotation();
  }

  @override
  void didUpdateWidget(covariant AnimatedSmoothIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateSizeAndRotation();
  }

  @override
  void forEachTween(visitor) {
    _offset = visitor(
      _offset,
      widget.activeIndex.toDouble(),
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>;
  }

  @override
  int get count => widget.count;

  @override
  IndicatorEffect get effect => widget.effect;

  @override
  Axis get axisDirection => widget.axisDirection;

  @override
  TextDirection? get textDirection => widget.textDirection;

  @override
  Widget build(BuildContext context) {
    final offset = _offset;
    if (offset == null) {
      throw 'Offset has not been initialized';
    }
    return SmoothIndicator(
      offset: offset.evaluate(animation),
      count: widget.count,
      effect: widget.effect,
      onDotClicked: widget.onDotClicked,
      size: size,
      quarterTurns: quarterTurns,
    );
  }
}
