import 'package:flutter/material.dart';
import 'package:kayle/UI/Screens/OnBoardiningSection/widgets/indicator/indicator_effect.dart';

abstract class BasicIndicatorPainter extends IndicatorPainter {
  final int count;

  final BasicIndicatorEffect _effect;

  final Paint dotPaint;

  final Radius dotRadius;

  BasicIndicatorPainter(
    super.offset,
    this.count,
    this._effect,
  )   : dotRadius = Radius.circular(_effect.radius),
        dotPaint = Paint()
          ..color = _effect.dotColor
          ..style = _effect.paintStyle
          ..strokeWidth = _effect.strokeWidth;

  double get distance => _effect.dotWidth + _effect.spacing;

  void paintStillDots(Canvas canvas, Size size) {
    for (var i = 0; i < count; i++) {
      final rect = buildStillDot(i, size);
      canvas.drawRRect(rect, dotPaint);
    }
  }

  RRect buildStillDot(int i, Size size) {
    final xPos = (i * distance);
    final yPos = size.height / 2;
    final bounds = Rect.fromLTRB(
      xPos,
      yPos - _effect.dotHeight / 2,
      xPos + _effect.dotWidth,
      yPos + _effect.dotHeight / 2,
    );
    var rect = RRect.fromRectAndRadius(bounds, dotRadius);
    return rect;
  }

  void maskStillDots(Size size, Canvas canvas) {
    var path = Path()..addRect((const Offset(0, 0) & size));
    for (var i = 0; i < count; i++) {
      path = Path.combine(PathOperation.difference, path,
          Path()..addRRect(buildStillDot(i, size)));
    }
    canvas.drawPath(path, Paint()..blendMode = BlendMode.clear);
  }

  RRect calcPortalTravel(Size size, double offset, double dotOffset) {
    final yPos = size.height / 2;
    var width = dotOffset * (_effect.dotHeight / 2);
    var height = dotOffset * (_effect.dotWidth / 2);
    var xPos = offset;
    return RRect.fromLTRBR(
      xPos - height,
      yPos - width,
      xPos + height,
      yPos + width,
      Radius.circular(dotRadius.x * dotOffset),
    );
  }
}

abstract class IndicatorPainter extends CustomPainter {
  final double offset;

  const IndicatorPainter(this.offset);

  @override
  bool shouldRepaint(IndicatorPainter oldDelegate) {
    return oldDelegate.offset != offset;
  }
}
