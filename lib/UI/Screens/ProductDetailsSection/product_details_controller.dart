import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';

class ProductDetailsController extends GetxController{
  RxString productImage = "".obs;
  RxInt quantity = 1.obs;
  RxInt selectedColorIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxInt selectedStarIndex = 3.obs;

  Rx<TextEditingController> reviewTitleController = TextEditingController().obs;
  Rx<TextEditingController> reviewMessageController = TextEditingController().obs;

  List<Color> colorsDataList = const [
    Color(0xFF08609C),
    Color(0xFFAD63C2),
    Color(0xFFDEAD3D),
    Color(0xFFCD3B3B),
    Color(0xFFFFE0D5),
  ];

  List<String> sizeDataList = const [
    "S",
    "M",
    "L",
    "XL",
  ];

  List<double> reviewDataList = const [
    0,
    0,
    0,
    .1,
    .9,
  ];

  List materialDetails = [
    "Lorem ipsum dolor sit amet consectetur",
    "Adipiscing elit sed do eiusmod tempor",
    "Incididunt ut labore et dolore",
    "Magna aliqua cursus metus",
  ];

  List descriptionImages = [
    ImageConstants.description1Img,
    ImageConstants.description2Img,
    ImageConstants.description3Img,
    ImageConstants.description4Img,
    ImageConstants.description5Img,
  ];

  List userReviewDataList = <UserReviewDataModel>[
    UserReviewDataModel(rate: 4,image: ImageConstants.menPng, name: "Nathan Cooper", time: "1h ago", review: "“They're awesome. If you're thinking about using anything from LA-Studio, just do it, you won't regret it. They're so good and make sure you're happy with your final product. Can't say enough great things about them!”",),
    UserReviewDataModel(rate: 4,image: ImageConstants.womenPng, name: "Adan Lauzon", time: "1h ago", review: "“Amazing design and easy building! Prompt support response! Several people in the Customer Support and all are helpful and cheerful! I bet you have a fun company environment in general! Thanks! :)”",),
  ];

  @override
  void onInit() {
    if(Get.arguments != null){
      productImage.value = Get.arguments[0];
      update([ControllerId.productDetailsKey]);
    }
    super.onInit();
  }

}

class UserReviewDataModel{
  String image;
  String time;
  String name;
  String review;
  int rate;

  UserReviewDataModel({
    required this.image,
    required this.time,
    required this.name,
    required this.review,
    required this.rate,
  });
}