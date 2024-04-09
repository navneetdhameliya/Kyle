import 'package:flutter/material.dart';

class CommonInkWell extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget child;

  const CommonInkWell({super.key, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: child,
    );
  }
}
