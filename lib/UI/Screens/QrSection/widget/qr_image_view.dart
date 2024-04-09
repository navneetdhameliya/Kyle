import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:kayle/UI/Screens/QrSection/widget/qr_painter.dart';
import 'package:qr/qr.dart';

class QrImageView extends StatefulWidget {
  QrImageView({
    required String data,
    super.key,
    this.size,
    this.padding = const EdgeInsets.all(10.0),
    this.backgroundColor = Colors.transparent,
    this.version = QrVersions.auto,
    this.errorCorrectionLevel = QrErrorCorrectLevel.L,
    this.errorStateBuilder,
    this.constrainErrorBounds = true,
    this.gapLess = true,
    this.embeddedImage,
    this.embeddedImageStyle,
    this.semanticsLabel = 'qr code',
    this.eyeStyle = const QrEyeStyle(
      eyeShape: QrEyeShape.square,
      color: Colors.black,
    ),
    this.dataModuleStyle = const QrDataModuleStyle(
      dataModuleShape: QrDataModuleShape.square,
      color: Colors.black,
    ),
    this.embeddedImageEmitsError = false,
    this.foregroundColor,
  })  : assert(
          QrVersions.isSupportedVersion(version),
          'QR code version $version is not supported',
        ),
        _data = data,
        _qrCode = null;

  QrImageView.withQr({
    required QrCode qr,
    super.key,
    this.size,
    this.padding = const EdgeInsets.all(10.0),
    this.backgroundColor = Colors.transparent,
    this.version = QrVersions.auto,
    this.errorCorrectionLevel = QrErrorCorrectLevel.L,
    this.errorStateBuilder,
    this.constrainErrorBounds = true,
    this.gapLess = true,
    this.embeddedImage,
    this.embeddedImageStyle,
    this.semanticsLabel = 'qr code',
    this.eyeStyle = const QrEyeStyle(
      eyeShape: QrEyeShape.square,
      color: Colors.black,
    ),
    this.dataModuleStyle = const QrDataModuleStyle(
      dataModuleShape: QrDataModuleShape.square,
      color: Colors.black,
    ),
    this.embeddedImageEmitsError = false,
    this.foregroundColor,
  })  : assert(
          QrVersions.isSupportedVersion(version),
          'QR code version $version is not supported',
        ),
        _data = null,
        _qrCode = qr;

  final String? _data;

  final QrCode? _qrCode;

  final Color backgroundColor;

  final int version;

  final int errorCorrectionLevel;

  final EdgeInsets padding;

  final double? size;

  final QrErrorBuilder? errorStateBuilder;

  final bool constrainErrorBounds;

  final bool gapLess;

  final ImageProvider? embeddedImage;

  final QrEmbeddedImageStyle? embeddedImageStyle;

  final bool embeddedImageEmitsError;

  final String semanticsLabel;

  final QrEyeStyle eyeStyle;

  final QrDataModuleStyle dataModuleStyle;

  final Color? foregroundColor;

  @override
  State<QrImageView> createState() => _QrImageViewState();
}

class _QrImageViewState extends State<QrImageView> {
  QrCode? _qr;

  late QrValidationResult _validationResult;

  @override
  Widget build(BuildContext context) {
    if (widget._data != null) {
      _validationResult = QrValidator.validate(
        data: widget._data!,
        version: widget.version,
        errorCorrectionLevel: widget.errorCorrectionLevel,
      );
      _qr = _validationResult.isValid ? _validationResult.qrCode : null;
    } else if (widget._qrCode != null) {
      _qr = widget._qrCode;
      _validationResult =
          QrValidationResult(status: QrValidationStatus.valid, qrCode: _qr);
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!_validationResult.isValid) {
          return _errorWidget(context, constraints, _validationResult.error);
        }

        final widgetSize = widget.size ?? constraints.biggest.shortestSide;
        if (widget.embeddedImage != null) {
          return FutureBuilder<ui.Image>(
            future: _loadQrImage(context, widget.embeddedImageStyle),
            builder: (ctx, snapshot) {
              if (snapshot.error != null) {
                debugPrint('snapshot error: ${snapshot.error}');
                return widget.embeddedImageEmitsError
                    ? _errorWidget(context, constraints, snapshot.error)
                    : _qrWidget(null, widgetSize);
              }
              if (snapshot.hasData) {
                debugPrint('loaded image');
                final loadedImage = snapshot.data;
                return _qrWidget(loadedImage, widgetSize);
              } else {
                return Container();
              }
            },
          );
        } else {
          return _qrWidget(null, widgetSize);
        }
      },
    );
  }

  Widget _qrWidget(ui.Image? image, double edgeLength) {
    final painter = QrPainter.withQr(
      qr: _qr!,
      color: widget.foregroundColor,
      gapLess: widget.gapLess,
      embeddedImageStyle: widget.embeddedImageStyle,
      embeddedImage: image,
      eyeStyle: widget.eyeStyle,
      dataModuleStyle: widget.dataModuleStyle,
    );
    return _QrContentView(
      edgeLength: edgeLength,
      backgroundColor: widget.backgroundColor,
      padding: widget.padding,
      semanticsLabel: widget.semanticsLabel,
      child: CustomPaint(painter: painter),
    );
  }

  Widget _errorWidget(
    BuildContext context,
    BoxConstraints constraints,
    Object? error,
  ) {
    final errorWidget = widget.errorStateBuilder == null
        ? Container()
        : widget.errorStateBuilder!(context, error);
    final errorSideLength = widget.constrainErrorBounds
        ? widget.size ?? constraints.biggest.shortestSide
        : constraints.biggest.longestSide;
    return _QrContentView(
      edgeLength: errorSideLength,
      backgroundColor: widget.backgroundColor,
      padding: widget.padding,
      semanticsLabel: widget.semanticsLabel,
      child: errorWidget,
    );
  }

  late ImageStreamListener streamListener;

  Future<ui.Image> _loadQrImage(
    BuildContext buildContext,
    QrEmbeddedImageStyle? style,
  ) {
    if (style != null) {}

    final mq = MediaQuery.of(buildContext);
    final completer = Completer<ui.Image>();
    final stream = widget.embeddedImage!.resolve(
      ImageConfiguration(
        devicePixelRatio: mq.devicePixelRatio,
      ),
    );

    streamListener = ImageStreamListener(
      (info, err) {
        stream.removeListener(streamListener);
        completer.complete(info.image);
      },
      onError: (err, _) {
        stream.removeListener(streamListener);
        completer.completeError(err);
      },
    );
    stream.addListener(streamListener);
    return completer.future;
  }
}

typedef QrErrorBuilder = Widget Function(BuildContext context, Object? error);

class _QrContentView extends StatelessWidget {
  const _QrContentView({
    required this.edgeLength,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.semanticsLabel,
  });

  final double edgeLength;

  final Color? backgroundColor;

  final EdgeInsets? padding;

  final Widget child;

  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: Container(
        width: edgeLength,
        height: edgeLength,
        color: backgroundColor,
        child: Padding(
          padding: padding!,
          child: child,
        ),
      ),
    );
  }
}

class QrVersions {
  static const int auto = -1;

  static const int min = 1;

  static const int max = 40;

  static bool isSupportedVersion(int version) =>
      version == auto || (version >= min && version <= max);
}

enum QrCodeElement {
  finderPatternOuter,
  finderPatternInner,
  finderPatternDot,
  codePixel,
  codePixelEmpty,
}

enum FinderPatternPosition {
  topLeft,
  topRight,
  bottomLeft,
}

enum QrEyeShape {
  square,
  circle,
}

enum QrDataModuleShape {
  square,
  circle,
}

@immutable
class QrEyeStyle {
  const QrEyeStyle({this.eyeShape, this.color});

  final QrEyeShape? eyeShape;

  final Color? color;

  @override
  int get hashCode => eyeShape.hashCode ^ color.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is QrEyeStyle) {
      return eyeShape == other.eyeShape && color == other.color;
    }
    return false;
  }
}

@immutable
class QrDataModuleStyle {
  const QrDataModuleStyle({
    this.dataModuleShape,
    this.color,
  });

  final QrDataModuleShape? dataModuleShape;

  final Color? color;

  @override
  int get hashCode => dataModuleShape.hashCode ^ color.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is QrDataModuleStyle) {
      return dataModuleShape == other.dataModuleShape && color == other.color;
    }
    return false;
  }
}

@immutable
class QrEmbeddedImageStyle {
  const QrEmbeddedImageStyle({
    this.size,
    this.color,
  });

  final Size? size;

  final Color? color;

  bool get hasDefinedSize => size != null && size!.longestSide > 0;

  @override
  int get hashCode => size.hashCode ^ color.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is QrEmbeddedImageStyle) {
      return size == other.size && color == other.color;
    }
    return false;
  }
}

class QrValidator {
  static QrValidationResult validate({
    required String data,
    int version = QrVersions.auto,
    int errorCorrectionLevel = QrErrorCorrectLevel.L,
  }) {
    late final QrCode qrCode;
    try {
      if (version != QrVersions.auto) {
        qrCode = QrCode(version, errorCorrectionLevel);
        qrCode.addData(data);
      } else {
        qrCode = QrCode.fromData(
          data: data,
          errorCorrectLevel: errorCorrectionLevel,
        );
      }
      return QrValidationResult(
        status: QrValidationStatus.valid,
        qrCode: qrCode,
      );
    } on InputTooLongException catch (title) {
      return QrValidationResult(
        status: QrValidationStatus.contentTooLong,
        error: title,
      );
    } on Exception catch (ex) {
      return QrValidationResult(status: QrValidationStatus.error, error: ex);
    }
  }
}

class QrValidationResult {
  QrValidationResult({required this.status, this.qrCode, this.error});

  QrValidationStatus status;

  QrCode? qrCode;

  Exception? error;

  bool get isValid => status == QrValidationStatus.valid;
}

enum QrValidationStatus {
  valid,
  contentTooLong,
  error,
}

class PaintCache {
  final List<Paint> _pixelPaints = <Paint>[];
  final Map<String, Paint> _keyedPaints = <String, Paint>{};

  String _cacheKey(QrCodeElement element, {FinderPatternPosition? position}) {
    final posKey = position != null ? position.toString() : 'any';
    return '$element:$posKey';
  }

  void cache(
    Paint paint,
    QrCodeElement element, {
    FinderPatternPosition? position,
  }) {
    if (element == QrCodeElement.codePixel) {
      _pixelPaints.add(paint);
    } else {
      _keyedPaints[_cacheKey(element, position: position)] = paint;
    }
  }

  Paint? firstPaint(QrCodeElement element, {FinderPatternPosition? position}) {
    return element == QrCodeElement.codePixel
        ? _pixelPaints.first
        : _keyedPaints[_cacheKey(element, position: position)];
  }

  List<Paint?> paints(
    QrCodeElement element, {
    FinderPatternPosition? position,
  }) {
    return element == QrCodeElement.codePixel
        ? _pixelPaints
        : <Paint?>[_keyedPaints[_cacheKey(element, position: position)]];
  }
}

class QrUnsupportedVersionException implements Exception {
  factory QrUnsupportedVersionException(int providedVersion) {
    final message =
        'Invalid version. $providedVersion is not >= ${QrVersions.min} '
        'and <= ${QrVersions.max}';
    return QrUnsupportedVersionException._internal(providedVersion, message);
  }

  QrUnsupportedVersionException._internal(this.providedVersion, this.message);

  final int providedVersion;

  final String message;

  @override
  String toString() => 'QrUnsupportedVersionException: $message';
}

class QrEmbeddedImageException implements Exception {
  factory QrEmbeddedImageException(String message) {
    return QrEmbeddedImageException._internal(message);
  }

  QrEmbeddedImageException._internal(this.message);

  final String message;

  @override
  String toString() => 'QrEmbeddedImageException: $message';
}
