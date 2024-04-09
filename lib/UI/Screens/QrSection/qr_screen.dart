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
  QrScreen({Key? key}) : super(key: key);

  Barcode? result;
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrController>(
        init: QrController(),
        id: KeyConstant.qrKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  Expanded(
                    flex: 5,
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderRadius: 18,
                        borderColor: Colors.white,
                        overlayColor: Colors.black.withOpacity(.9),
                        cutOutSize: MediaQuery.sizeOf(context).width-78,
                      ),
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

  void _onQRViewCreated(QRViewController qrController) {
    qrViewController = qrController;
    qrController.scannedDataStream.listen((scanData) {
      result = scanData;
      controller.update();
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

  Widget newArrival() {
    return GridView.builder(
      itemCount: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 4 / 5),
      itemBuilder: (context, index) {
        return InkWell(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                          image: AssetImage(ImageConstants.womenPng),
                          fit: BoxFit.cover),
                    ),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeColors.background(context),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        ImageConstants.saveMarkIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12)),
                        color: ThemeColors.background(context),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  ThemeColors.shadow(context).withOpacity(.2),
                              blurRadius: 10,
                              offset: const Offset(0, 6)),
                        ]),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadlineBodyOneBaseWidget(
                          title: "Fashion",
                          titleColor: Colors.black.withOpacity(.4),
                        ),
                        const HeadlineBodyOneBaseWidget(
                          title: "Linen slim-fit t-shirt",
                          fontSize: 12,
                        ),
                        const HeadlineBodyOneBaseWidget(
                          title: "\$ 40.00",
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
