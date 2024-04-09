import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController arrivalTabController = TabController(
    length: 2,
    vsync: this,
  );
  RxInt arrivalTabIndex = 0.obs;
  PageController arrivalTabPageController = PageController();

  RxInt selectedFeaturedTab = 0.obs;

  List featuredTab = [
    "All Product",
    "Men",
    "Women",
    "Bags",
    "Shoes",
  ];
}
