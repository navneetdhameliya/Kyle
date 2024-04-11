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

  List bandImages = [
    "https://i.pinimg.com/originals/20/60/2d/20602d43cc993811e5a6bd1886af4f33.png",
    "https://upload.wikimedia.org/wikipedia/commons/2/24/Adidas_logo.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Under_armour_logo.svg/1200px-Under_armour_logo.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/8/88/Puma-Logo.png",
    "https://etimg.etb2bimg.com/photo/105930083.cms",
    "https://vegacitymall.com/wp-content/uploads/2021/04/Roadstar.png",
  ];
}
