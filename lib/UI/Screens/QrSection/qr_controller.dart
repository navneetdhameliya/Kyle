import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrController extends GetxController {
  Barcode? result;
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void onQRViewCreated(QRViewController qrController) {
    qrViewController = qrController;
    qrController.scannedDataStream.listen((scanData) {
      result = scanData;
      update([ControllerId.qrKey]);
    });
  }
}