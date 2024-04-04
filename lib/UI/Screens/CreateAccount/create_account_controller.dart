import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';

class CreateAccountController extends GetxController {
  XFile? selectedImage;
  Rx<TextEditingController> txtEmailController = Rx(TextEditingController());
  Rx<TextEditingController> txtFullNameController = Rx(TextEditingController());
  Rx<TextEditingController> txtDateOfBirth = Rx(TextEditingController());
  Rx<TextEditingController> txtGender = Rx(TextEditingController());
  Rx<TextEditingController> txtRegion = Rx(TextEditingController());
  Rx<TextEditingController> txtPasswordController = Rx(TextEditingController());
  Rx<TextEditingController> txtPhoneController = Rx(TextEditingController());
  RxBool selectedRadio = false.obs;
  DateTime selectedDate = DateTime.now();

   selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {

        selectedDate = picked;
        txtDateOfBirth.value.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      update([KeyConstant.setUpAccountKey]);
    }
  }
}
