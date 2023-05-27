import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  _initData() {
    update(["home"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  // tab切换
  onBottomNavBarTab(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 200),
      curve: Curves.ease,
    );
  }

  // 页面切换
  onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
