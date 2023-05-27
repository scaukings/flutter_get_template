import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class LocalizationIntl {
  static Future<LocalizationIntl> load(Locale locale) {
    // 加载语言名称
    final String name =
        locale.countryCode == null || locale.countryCode!.isEmpty
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return LocalizationIntl();
    });
  }

  static LocalizationIntl? of(BuildContext context) {
    return Localizations.of<LocalizationIntl>(context, LocalizationIntl);
  }

  // 设备应用
  String get appName {
    return Intl.message(
      '智能设备应用',
      name: 'appName',
      desc: '应用名称的名称',
    );
  }

  // tab标签首页
  String get tabHome {
    return Intl.message(
      '首页',
      name: 'tabHome',
      desc: '首页tab标签的label',
    );
  }

  // 首页tab标签列表
  String get homeTab0Label {
    return Intl.message(
      '设备',
      name: 'homeTab0Label',
      desc: '设备页面tab',
    );
  }

  String get homeTab1Label {
    return Intl.message(
      'AI助手',
      name: 'homeTab1Label',
      desc: 'AI助手页面tab',
    );
  }

  String get homeTab2Label {
    return Intl.message(
      '互动',
      name: 'homeTab2Label',
      desc: '互动页面tab',
    );
  }

  String get homeTab3Label {
    return Intl.message(
      '我的',
      name: 'homeTab3Label',
      desc: '我的页面tab',
    );
  }
}

//Locale代理类
class LocalizationIntlDelegate extends LocalizationsDelegate<LocalizationIntl> {
  const LocalizationIntlDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<LocalizationIntl> load(Locale locale) {
    return LocalizationIntl.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(LocalizationIntlDelegate old) => false;
}
