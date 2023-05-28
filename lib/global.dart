import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'common/utils/loading.dart';
import 'models/profile.dart';
import 'services/storage.dart';
import 'states/user.dart';
import 'states/system.dart';

class Global {
  static late ProfileModel _profile;

  static get profile => _profile;

  static Future init() async {
    // 应用程序已经完成初始化
    WidgetsFlutterBinding.ensureInitialized();
    // 初始化loading
    Loading.init();
    // 设置系统UI
    setSystemUi();
    // 初始化service
    await _initService();
  }

  // 初始化service
  static _initService() async {
    await Get.putAsync(() => StorageService().init());
    // 系统信息
    Get.put(SystemState());
    // 用户信息
    Get.put(UserState());
  }

  // 设置系统UI
  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
