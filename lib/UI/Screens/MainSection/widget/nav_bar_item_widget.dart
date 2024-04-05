import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';

class NavBarItemWidget extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final String? label;
  final TextStyle? labelStyle;
  final bool selected;

  const NavBarItemWidget({super.key,
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    this.label,
    this.labelStyle,
    this.selected=false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => onTap(index),
        child: _buildItem(selected),
      ),
    );
  }

  Widget _buildItem(selected) {
    if (label == null) {
      return Column(
        children: [
          Expanded(child: _buildIcon()),
          SizedBox(height: Platform.isIOS ? 20.0 : 0),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(),
        const SizedBox(height: 4.0),
        if(selected)
        Container(
          height: 6,
          width:  6,
          decoration: BoxDecoration(
          color: ThemeColors.buttonActive,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: Platform.isIOS ? 20.0 : 0.0),
      ],
    );
  }

  Widget _buildIcon() {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Transform.translate(
      offset: Offset(
        0,
        difference < 1.0 / length ? verticalAlignment * 40 : 0,
      ),
      child: Opacity(
        opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
        child: child,
      ),
    );
  }
}