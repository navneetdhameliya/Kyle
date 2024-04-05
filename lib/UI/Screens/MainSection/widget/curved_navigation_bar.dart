import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/UI/Screens/MainSection/main_controller.dart';
import 'package:kayle/UI/Screens/MainSection/widget/curved_navigation_bar_item.dart';
import 'package:kayle/UI/Screens/MainSection/widget/nav_bar_item_widget.dart';
import 'package:kayle/UI/Screens/MainSection/widget/nav_custom_painter.dart';

typedef LetIndexPage = bool Function(int value);

class CurvedNavigationBar extends StatefulWidget {
  final List<CurvedNavigationBarItem> items;

  final int index;

  final Color color;

  final Color? buttonBackgroundColor;

  final Color backgroundColor;

  final ValueChanged<int>? onTap;

  final LetIndexPage letIndexChange;

  final Curve animationCurve;

  final Duration animationDuration;

  final double iconPadding;

  CurvedNavigationBar({
    Key? key,
    required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 250),
    this.iconPadding = 12.0,
    double? height,
  })  : assert(items.isNotEmpty),
        assert(0 <= index && index < items.length),
        letIndexChange = letIndexChange ?? ((_) => true),

        // hasLabel = items.any((item) => item.label != null),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  // late double _startingPos;
  late double _pos;
  late AnimationController _animationController;
  late int _length;

  // int _endingIndex = 0;
  // double _buttonHide = 0;

  double height = (Platform.isAndroid ? 70.0 : 80.0);

  @override
  void initState() {
    super.initState();
    _length = widget.items.length;
    _pos = widget.index / _length;
    // _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        // final endingPos = _endingIndex / widget.items.length;
        // final middle = (endingPos + _startingPos) / 2;
        // _buttonHide = (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      // _startingPos = 2;
      // _endingIndex = widget.index;
      _animationController.animateTo(
        newPosition,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(120),
        color: widget.backgroundColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Selected button
          Positioned(
            bottom: height - 35.0,
            width: size.width / _length,
            child: Material(
              color: widget.buttonBackgroundColor ?? widget.color,
              type: MaterialType.circle,
              child: Padding(
                padding: EdgeInsets.all(widget.iconPadding),
                child: widget.items[2].child,
              ),
            ),
          ),
          // Background

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(35)),
              child: CustomPaint(
                painter: NavCustomPainter(
                  startingLoc: 0.4,
                  itemsLength: _length,
                  color: widget.color,
                  textDirection: Directionality.of(context),
                ),
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                  ),
                ),
              ),
            ),
          ),
          // Unselected buttons
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: height,
              child: Row(
                children: widget.items.map((item) {
                  return NavBarItemWidget(
                    onTap: _buttonTap,
                    selected: Get.put(MainController()).currentPage.value ==
                        widget.items.indexOf(item),
                    position: 0.4,
                    length: _length,
                    index: widget.items.indexOf(item),
                    child: Center(child: item.child),
                  );
                }).toList(),
              ),
            ),
          ),
          Positioned(
            bottom: height - 145.0,
            left: _pos * size.width,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, (0 /*_buttonHide*/ - 1) * 80),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: ThemeColors.buttonActive,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index) || _animationController.isAnimating) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    if (index == 2) {
      return;
    }
    final newPosition = index / _length;
    setState(() {
      // _startingPos = _pos;
      // _endingIndex = index;
      _animationController.animateTo(
        newPosition,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    });
  }
}
