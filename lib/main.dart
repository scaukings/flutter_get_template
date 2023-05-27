import 'package:ai_device_app/states/system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';
import 'routes/index.dart';
import 'common/utils/refresh_header_builder.dart';
import 'i10n/localization_intl.dart';

void main() {
  Global.init().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return RefreshConfiguration(
          headerBuilder: refreshHeader,
          hideFooterWhenNotFull: true,
          child: GetMaterialApp(
            onGenerateTitle: (context) {
              return LocalizationIntl.of(context)?.appName ?? "";
            },
            // 主题色
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // 路由配置
            getPages: RoutePages.routes,
            // 初始化路由
            initialRoute: RoutePages.initRoute,
            builder: EasyLoading.init(),
            // translations: TranslationService(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              LocalizationIntlDelegate(),
            ],
            // 系统语言
            locale: SystemState.to.locale,
            fallbackLocale: SystemState.initialLocal,
            supportedLocales: SystemState.supportedLocales,
            debugShowCheckedModeBanner: false,
            localeResolutionCallback: (
              Locale? locale,
              Iterable<Locale> supportedLocales,
            ) {
              if (locale == null) {
                return SystemState.initialLocal;
              }
              return locale;
            },
          ),
        );
      },
    );
  }
}
