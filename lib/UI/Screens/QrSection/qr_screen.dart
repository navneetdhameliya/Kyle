import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Commons/common_text_widget.dart';
import 'package:kayle/UI/Screens/QrSection/qr_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

//ignore: must_be_immutable
class QrScreen extends GetView<QrController> {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrController>(
        init: QrController(),
        id: ControllerId.qrKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  QRView(
                    key: controller.qrKey,
                    onQRViewCreated: controller.onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderRadius: 18,
                      borderColor: Colors.white,
                      overlayColor: Colors.black.withOpacity(.9),
                      cutOutSize: MediaQuery.sizeOf(context).width-78,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 112,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageConstants.flashIcon,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                              const HeadlineBodyOneBaseWidget(
                                title: 'On/Off Flash',
                                fontSize: 10,
                                titleColor: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageConstants.imageIcon,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                              const HeadlineBodyOneBaseWidget(
                                title: 'Choose QR Image',
                                fontSize: 10,
                                titleColor: Colors.white,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageConstants.qrIcon,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                              const HeadlineBodyOneBaseWidget(
                                title: 'My QR Code',
                                fontSize: 10,
                                titleColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  appBar(context).paddingSymmetric(vertical: 48,horizontal: 24),
                ],
              ),
            ),
          );
        });
  }

  Widget appBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ()=>Get.back(),
          child: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              ImageConstants.backButton,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: const HeadlineBodyOneBaseWidget(
            title: "SCAN QR CODE",
            fontSize: 12.0,
            titleColor: Colors.black,
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
