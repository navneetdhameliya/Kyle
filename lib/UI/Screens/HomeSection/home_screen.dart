import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/UI/Screens/HomeSection/widget/curved_navigation_bar.dart';

import 'home_controller.dart';
import 'widget/curved_navigation_bar_item.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        id: KeyConstant.loginKey,
        builder: (controller) {
          return Scaffold(
            backgroundColor: ThemeColors.background(context),
            body: const Center(child: Text('asdfasdfasdf')),
            // floatingActionButton: FloatingActionButton(
            //   shape: const CircleBorder(),
            //   backgroundColor: ThemeColors.buttonActive,
            //   onPressed: (){},
            //   child: Icon(Icons.qr_code_scanner_sharp,color: ThemeColors.background(context),),
            // ),
            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: ThemeColors.primary(context).withOpacity(.2),
                    blurRadius: 100,
                  ),
                ],
              ),
              child: CurvedNavigationBar(
              // key: _bottomNavigationKey,
              index: 2,
              items: const [
                CurvedNavigationBarItem(
                  child: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.search),
                  label: 'Search',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.chat_bubble_outline),
                  label: '',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.newspaper),
                  label: 'Feed',
                ),
                CurvedNavigationBarItem(
                  child: Icon(Icons.perm_identity),
                  label: 'Personal',
                ),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 600),
              onTap: (index) {
                  controller.currentPage.value = index;
              },
              letIndexChange: (index) => true,
                            ),
            ),
          );
        });
  }
}

