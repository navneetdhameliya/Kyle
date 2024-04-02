

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:kayle/Infrastructure/Constants/route_constants.dart';

class CreateAccountController extends GetxController {

  Rx<TextEditingController> txtEmailController =  Rx(TextEditingController());
  Rx<TextEditingController> txtFullNameController =  Rx(TextEditingController());
  Rx<TextEditingController> txtDateOfBirth =  Rx(TextEditingController());
  Rx<TextEditingController> txtGender =  Rx(TextEditingController());
  Rx<TextEditingController> txtRegion =  Rx(TextEditingController());
  Rx<TextEditingController> txtPasswordController =  Rx(TextEditingController());
    Rx<TextEditingController> txtPhoneController =  Rx(TextEditingController());
RxBool selectedRadio =false.obs;
}
