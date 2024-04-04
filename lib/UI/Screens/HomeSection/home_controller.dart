import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';

class HomeController extends GetxController {
  bool enableResend = false;
  int secondsRemaining = 60;
  Timer? timer;
  Rx<TextEditingController> txtEmailController =  Rx(TextEditingController());
  Rx<TextEditingController> txtForgotEmailController =  Rx(TextEditingController());
  Rx<TextEditingController> txtPasswordController =  Rx(TextEditingController());
  Rx<TextEditingController> txtPhoneRecoveryController =  Rx(TextEditingController());
  Rx<TextEditingController> txtSetPasswordController =  Rx(TextEditingController());
  Rx<TextEditingController> txtSetConfirmPasswordController =  Rx(TextEditingController());
  RxString countryCode =  "".obs;
  Rx<TextEditingController> txtConfirmEmailOtp = TextEditingController().obs;

  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();

  animateToPage(int page, {withAnimation = false}) {
    currentPage.value = page;
    update();
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: withAnimation ? 250 : 1),
      curve: Curves.easeIn,
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {

      if (secondsRemaining > 1) {
        secondsRemaining--;
      } else {
        enableResend = false;
        timer.cancel();
      }
      update([KeyConstant.verifyOtpKey]);

    });
  }
  void resetTimer(BuildContext context) {
    FocusScope.of(context).unfocus();
    txtConfirmEmailOtp.value.clear();
    update([KeyConstant.verifyOtpKey]);
    secondsRemaining = 30;
    enableResend = true;
    update([KeyConstant.verifyOtpKey]);
    startTimer();
  }
}
class CommonWrapper extends StatefulWidget {
  const CommonWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<CommonWrapper> createState() => _CommonWrapperState();
}

class _CommonWrapperState extends State<CommonWrapper> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}