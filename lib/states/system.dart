import 'package:ai_device_app/common/values/storage_keys.dart';
import 'package:ai_device_app/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemState extends GetxController {
  static SystemState get to => Get.find();

  // 是否第一次打开应用
  final RxBool _firstOpen = true.obs;
  bool get firstOpen => _firstOpen.value;
  // 系统支持的语言
  static const List<Locale> supportedLocales = [
    Locale('zh', 'CN'), // 中文
    Locale('en', 'US'), // 英文
  ];
  // 默认语言
  static const Locale initialLocal = Locale('en', 'US');
  // 系统语言
  final Rx<Locale> _locale = initialLocal.obs;
  Locale get locale => _locale.value;

  @override
  void onInit() {
    super.onInit();
    _firstOpen.value = StorageService.to.getBool(StorageKey.firstOpen) ?? true;
    print('初始化系统设置');
  }

  // 标记非第一次打开应用
  Future<bool> firstOpenState() async {
    _firstOpen.value = false;
    return await StorageService.to.setBool(StorageKey.firstOpen, true);
  }

  // 获取初始化语言
  initLocale() {
    String code = StorageService.to.getString(StorageKey.systemLanguage);
    if (code.isEmpty) {
      return;
    }
    int index = supportedLocales.indexWhere((element) {
      return element.languageCode == code;
    });
    if (index >= 0) {
      _locale.value = supportedLocales[index];
    }
  }

  // 用户切换了语言
  updateLocale(Locale locale) {
    _locale.value = locale;
    Get.updateLocale(locale);
    StorageService.to.setString(StorageKey.systemLanguage, locale.languageCode);
  }
}
