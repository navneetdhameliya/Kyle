import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';

class LoginController extends GetxController {
  bool enableResend = false;
  int secondsRemaining = 60;
  Timer? timer;
  Rx<TextEditingController> txtEmailController = Rx(TextEditingController());
  Rx<TextEditingController> txtForgotEmailController =
      Rx(TextEditingController());
  Rx<TextEditingController> txtPasswordController = Rx(TextEditingController());
  Rx<TextEditingController> txtPhoneRecoveryController =
      Rx(TextEditingController());
  Rx<TextEditingController> txtSetPasswordController =
      Rx(TextEditingController());
  Rx<TextEditingController> txtSetConfirmPasswordController =
      Rx(TextEditingController());
  RxString countryCode = "".obs;
  Rx<TextEditingController> txtConfirmEmailOtp = TextEditingController().obs;

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
