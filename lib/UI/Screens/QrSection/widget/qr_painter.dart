import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kayle/UI/Screens/QrSection/widget/qr_image_view.dart';
import 'package:qr/qr.dart';

const int _finderPatternLimit = 7;

const Color? _qrDefaultColor = null;

class QrPainter extends CustomPainter {
  QrPainter({
    required String data,
    required this.version,
    this.errorCorrectionLevel = QrErrorCorrectLevel.L,
    this.gapLess = false,
    this.embeddedImage,
    this.embeddedImageStyle,
    this.eyeStyle = const QrEyeStyle(
      eyeShape: QrEyeShape.square,
      color: Color(0xFF000000),
    ),
    this.dataModuleStyle = const QrDataModuleStyle(
      dataModuleShape: QrDataModuleShape.square,
      color: Color(0xFF000000),
    ),
    this.color = _qrDefaultColor,
    this.emptyColor,
  }) : assert(
          QrVersions.isSupportedVersion(version),
          'QR code version $version is not supported',
        ) {
    _init(data);
  }

  QrPainter.withQr({
    required QrCode qr,
    this.gapLess = false,
    this.embeddedImage,
    this.embeddedImageStyle,
    this.eyeStyle = const QrEyeStyle(
      eyeShape: QrEyeShape.square,
      color: Color(0xFF000000),
    ),
    this.dataModuleStyle = const QrDataModuleStyle(
      dataModuleShape: QrDataModuleShape.square,
      color: Color(0xFF000000),
    ),
    this.color = _qrDefaultColor,
    this.emptyColor,
  })  : _qr = qr,
        version = qr.typeNumber,
        errorCorrectionLevel = qr.errorCorrectLevel {
    _calcVersion = version;
    _initPaints();
  }

  final int version;

  final int errorCorrectionLevel;

  final bool gapLess;

  final ui.Image? embeddedImage;

  final QrEmbeddedImageStyle? embeddedImageStyle;

  final QrEyeStyle eyeStyle;

  final QrDataModuleStyle dataModuleStyle;

  QrCode? _qr;

  late QrImage _qrImage;

  late final int _calcVersion;

  final double _gapSize = 0.25;

  final PaintCache _paintCache = PaintCache();

  final Color? color;

  final Color? emptyColor;

  void _init(String data) {
    if (!QrVersions.isSupportedVersion(version)) {
      throw QrUnsupportedVersionException(version);
    }

    final validationResult = QrValidator.validate(
      data: data,
      version: version,
      errorCorrectionLevel: errorCorrectionLevel,
    );
    if (!validationResult.isValid) {
      throw validationResult.error!;
    }
    _qr = validationResult.qrCode;
    _calcVersion = _qr!.typeNumber;
    _initPaints();
  }

  void _initPaints() {
    _qrImage = QrImage(_qr!);

    _paintCache.cache(
      Paint()..style = PaintingStyle.fill,
      QrCodeElement.codePixel,
    );

    _paintCache.cache(
      Paint()..style = PaintingStyle.fill,
      QrCodeElement.codePixelEmpty,
    );

    for (final position in FinderPatternPosition.values) {
      _paintCache.cache(
        Paint()..style = PaintingStyle.stroke,
        QrCodeElement.finderPatternOuter,
        position: position,
      );
      _paintCache.cache(
        Paint()..style = PaintingStyle.stroke,
        QrCodeElement.finderPatternInner,
        position: position,
      );
      _paintCache.cache(
        Paint()..style = PaintingStyle.fill,
        QrCodeElement.finderPatternDot,
        position: position,
      );
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.shortestSide == 0) {
      debugPrint(
          "[QR] WARN: width or height is zero. You should set a 'size' value "
          'or nest this painter in a Widget that defines a non-zero size');
      return;
    }

    final paintMetrics = _PaintMetrics(
      containerSize: size.shortestSide,
      moduleCount: _qr!.moduleCount,
      gapSize: gapLess ? 0 : _gapSize,
    );

    _drawFinderPatternItem(
      FinderPatternPosition.topLeft,
      canvas,
      paintMetrics,
    );
    _drawFinderPatternItem(
      FinderPatternPosition.bottomLeft,
      canvas,
      paintMetrics,
    );
    _drawFinderPatternItem(
      FinderPatternPosition.topRight,
      canvas,
      paintMetrics,
    );

    double left;
    double top;
    final gap = !gapLess ? _gapSize : 0;

    final pixelPaint = _paintCache.firstPaint(QrCodeElement.codePixel);
    if (color != null) {
      pixelPaint!.color = color!;
    } else {
      pixelPaint!.color = dataModuleStyle.color!;
    }
    Paint? emptyPixelPaint;
    if (emptyColor != null) {
      emptyPixelPaint = _paintCache.firstPaint(QrCodeElement.codePixelEmpty);
      emptyPixelPaint!.color = emptyColor!;
    }
    for (var x = 0; x < _qr!.moduleCount; x++) {
      for (var y = 0; y < _qr!.moduleCount; y++) {
        if (_isFinderPatternPosition(x, y)) {
          continue;
        }
        final paint = _qrImage.isDark(y, x) ? pixelPaint : emptyPixelPaint;
        if (paint == null) {
          continue;
        }

        left = paintMetrics.inset + (x * (paintMetrics.pixelSize + gap));
        top = paintMetrics.inset + (y * (paintMetrics.pixelSize + gap));
        var pixelHTweak = 0.0;
        var pixelVTweak = 0.0;
        if (gapLess && _hasAdjacentHorizontalPixel(x, y, _qr!.moduleCount)) {
          pixelHTweak = 0.5;
        }
        if (gapLess && _hasAdjacentVerticalPixel(x, y, _qr!.moduleCount)) {
          pixelVTweak = 0.5;
        }
        final squareRect = Rect.fromLTWH(
          left,
          top,
          paintMetrics.pixelSize + pixelHTweak,
          paintMetrics.pixelSize + pixelVTweak,
        );
        if (dataModuleStyle.dataModuleShape == QrDataModuleShape.square) {
          canvas.drawRect(squareRect, paint);
        } else {
          final roundedRect = RRect.fromRectAndRadius(
            squareRect,
            Radius.circular(paintMetrics.pixelSize + pixelHTweak),
          );
          canvas.drawRRect(roundedRect, paint);
        }
      }
    }

    if (embeddedImage != null) {
      final originalSize = Size(
        embeddedImage!.width.toDouble(),
        embeddedImage!.height.toDouble(),
      );
      final requestedSize =
          // ignore: prefer_null_aware_operators
          embeddedImageStyle != null ? embeddedImageStyle!.size : null;
      final imageSize = _scaledAspectSize(size, originalSize, requestedSize);
      final position = Offset(
        (size.width - imageSize.width) / 2.0,
        (size.height - imageSize.height) / 2.0,
      );

      _drawImageOverlay(canvas, position, imageSize, embeddedImageStyle);
    }
  }

  bool _hasAdjacentVerticalPixel(int x, int y, int moduleCount) {
    if (y + 1 >= moduleCount) {
      return false;
    }
    return _qrImage.isDark(y + 1, x);
  }

  bool _hasAdjacentHorizontalPixel(int x, int y, int moduleCount) {
    if (x + 1 >= moduleCount) {
      return false;
    }
    return _qrImage.isDark(y, x + 1);
  }

  bool _isFinderPatternPosition(int x, int y) {
    final isTopLeft = y < _finderPatternLimit && x < _finderPatternLimit;
    final isBottomLeft = y < _finderPatternLimit &&
        (x >= _qr!.moduleCount - _finderPatternLimit);
    final isTopRight = y >= _qr!.moduleCount - _finderPatternLimit &&
        (x < _finderPatternLimit);
    return isTopLeft || isBottomLeft || isTopRight;
  }

  void _drawFinderPatternItem(
    FinderPatternPosition position,
    Canvas canvas,
    _PaintMetrics metrics,
  ) {
    final totalGap = (_finderPatternLimit - 1) * metrics.gapSize;
    final radius = ((_finderPatternLimit * metrics.pixelSize) + totalGap) -
        metrics.pixelSize;
    final strokeAdjust = metrics.pixelSize / 2.0;
    final edgePos =
        (metrics.inset + metrics.innerContentSize) - (radius + strokeAdjust);

    Offset offset;
    if (position == FinderPatternPosition.topLeft) {
      offset =
          Offset(metrics.inset + strokeAdjust, metrics.inset + strokeAdjust);
    } else if (position == FinderPatternPosition.bottomLeft) {
      offset = Offset(metrics.inset + strokeAdjust, edgePos);
    } else {
      offset = Offset(edgePos, metrics.inset + strokeAdjust);
    }

    final outerPaint = _paintCache.firstPaint(
      QrCodeElement.finderPatternOuter,
      position: position,
    )!;
    outerPaint.strokeWidth = metrics.pixelSize;
    outerPaint.color = color != null ? color! : eyeStyle.color!;

    final innerPaint = _paintCache.firstPaint(QrCodeElement.finderPatternInner,
        position: position)!;
    innerPaint.strokeWidth = metrics.pixelSize;
    innerPaint.color = emptyColor ?? const Color(0x00ffffff);

    final dotPaint = _paintCache.firstPaint(
      QrCodeElement.finderPatternDot,
      position: position,
    );
    if (color != null) {
      dotPaint!.color = color!;
    } else {
      dotPaint!.color = eyeStyle.color!;
    }

    final outerRect = Rect.fromLTWH(offset.dx, offset.dy, radius, radius);

    final innerRadius = radius - (2 * metrics.pixelSize);
    final innerRect = Rect.fromLTWH(
      offset.dx + metrics.pixelSize,
      offset.dy + metrics.pixelSize,
      innerRadius,
      innerRadius,
    );

    final gap = metrics.pixelSize * 2;
    final dotSize = radius - gap - (2 * strokeAdjust);
    final dotRect = Rect.fromLTWH(
      offset.dx + metrics.pixelSize + strokeAdjust,
      offset.dy + metrics.pixelSize + strokeAdjust,
      dotSize,
      dotSize,
    );

    if (eyeStyle.eyeShape == QrEyeShape.square) {
      canvas.drawRect(outerRect, outerPaint);
      canvas.drawRect(innerRect, innerPaint);
      canvas.drawRect(dotRect, dotPaint);
    } else {
      final roundedOuterStrokeRect =
          RRect.fromRectAndRadius(outerRect, Radius.circular(radius));
      canvas.drawRRect(roundedOuterStrokeRect, outerPaint);

      final roundedInnerStrokeRect =
          RRect.fromRectAndRadius(outerRect, Radius.circular(innerRadius));
      canvas.drawRRect(roundedInnerStrokeRect, innerPaint);

      final roundedDotStrokeRect =
          RRect.fromRectAndRadius(dotRect, Radius.circular(dotSize));
      canvas.drawRRect(roundedDotStrokeRect, dotPaint);
    }
  }

  bool _hasOneNonZeroSide(Size size) => size.longestSide > 0;

  Size _scaledAspectSize(
    Size widgetSize,
    Size originalSize,
    Size? requestedSize,
  ) {
    if (requestedSize != null && !requestedSize.isEmpty) {
      return requestedSize;
    } else if (requestedSize != null && _hasOneNonZeroSide(requestedSize)) {
      final maxSide = requestedSize.longestSide;
      final ratio = maxSide / originalSize.longestSide;
      return Size(ratio * originalSize.width, ratio * originalSize.height);
    } else {
      final maxSide = 0.25 * widgetSize.shortestSide;
      final ratio = maxSide / originalSize.longestSide;
      return Size(ratio * originalSize.width, ratio * originalSize.height);
    }
  }

  void _drawImageOverlay(
    Canvas canvas,
    Offset position,
    Size size,
    QrEmbeddedImageStyle? style,
  ) {
    final paint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high;
    if (style != null) {
      if (style.color != null) {
        paint.colorFilter = ColorFilter.mode(style.color!, BlendMode.srcATop);
      }
    }
    final srcSize =
        Size(embeddedImage!.width.toDouble(), embeddedImage!.height.toDouble());
    final src = Alignment.center.inscribe(srcSize, Offset.zero & srcSize);
    final dst = Alignment.center.inscribe(size, position & size);
    canvas.drawImageRect(embeddedImage!, src, dst, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is QrPainter) {
      return errorCorrectionLevel != oldDelegate.errorCorrectionLevel ||
          _calcVersion != oldDelegate._calcVersion ||
          _qr != oldDelegate._qr ||
          gapLess != oldDelegate.gapLess ||
          embeddedImage != oldDelegate.embeddedImage ||
          embeddedImageStyle != oldDelegate.embeddedImageStyle ||
          eyeStyle != oldDelegate.eyeStyle ||
          dataModuleStyle != oldDelegate.dataModuleStyle;
    }
    return true;
  }

  ui.Picture toPicture(double size) {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    paint(canvas, Size(size, size));
    return recorder.endRecording();
  }

  Future<ui.Image> toImage(double size) {
    return toPicture(size).toImage(size.toInt(), size.toInt());
  }

  Future<ByteData?> toImageData(
    double size, {
    ui.ImageByteFormat format = ui.ImageByteFormat.png,
  }) async {
    final image = await toImage(size);
    return image.toByteData(format: format);
  }
}

class _PaintMetrics {
  _PaintMetrics({
    required this.containerSize,
    required this.gapSize,
    required this.moduleCount,
  }) {
    _calculateMetrics();
  }

  final int moduleCount;
  final double containerSize;
  final double gapSize;

  late final double _pixelSize;

  double get pixelSize => _pixelSize;

  late final double _innerContentSize;

  double get innerContentSize => _innerContentSize;

  late final double _inset;

  double get inset => _inset;

  void _calculateMetrics() {
    final gapTotal = (moduleCount - 1) * gapSize;
    final pixelSize = (containerSize - gapTotal) / moduleCount;
    _pixelSize = (pixelSize * 2).roundToDouble() / 2;
    _innerContentSize = (_pixelSize * moduleCount) + gapTotal;
    _inset = (containerSize - _innerContentSize) / 2;
  }
}
