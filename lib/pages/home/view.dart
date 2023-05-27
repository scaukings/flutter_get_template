import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_device_app/i10n/localization_intl.dart';
import 'package:ai_device_app/pages/ai_chat/index.dart';
import 'package:ai_device_app/pages/ai_device/index.dart';
import 'package:ai_device_app/pages/ai_mall/index.dart';
import 'package:ai_device_app/pages/profile/index.dart';
import 'package:ai_device_app/common/config/app_theme.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HomeViewGetX();
  }
}

class _HomeViewGetX extends GetView<HomeController> {
  const _HomeViewGetX({Key? key}) : super(key: key);
  // 底部导航栏
  static List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_max_rounded),
      label: LocalizationIntl.of(Get.context!)!.homeTab0Label,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_max_rounded),
      label: LocalizationIntl.of(Get.context!)!.homeTab1Label,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_max_rounded),
      label: LocalizationIntl.of(Get.context!)!.homeTab2Label,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_max_rounded),
      label: LocalizationIntl.of(Get.context!)!.homeTab3Label,
    ),
  ];

  // tab页面
  static const List<Widget> pages = [
    AiDevicePage(),
    AiChatPage(),
    AiMallPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(context),
          ),
          bottomNavigationBar: _buildBottomNavigationBar(),
        );
      },
    );
  }

  // 主视图
  PageView _buildView(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      children: pages,
    );
  }

  Obx _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        items: items,
        elevation: 0,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: const Color.fromRGBO(106, 106, 106, 1),
        backgroundColor: Colors.white,
        onTap: controller.onBottomNavBarTab,
      ),
    );
  }
}
