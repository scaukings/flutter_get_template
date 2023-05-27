import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'names.dart';
import 'observers.dart';
import 'package:ai_device_app/pages/home/index.dart';
import 'package:ai_device_app/pages/login/index.dart';

class RoutePages {
  static const initRoute = RouteNames.initRoute; // 默认路由
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
  static final List<GetPage> routes = [
    // 首页
    GetPage(name: RouteNames.homeRoute, page: () => const HomePage()),
    // 登录页面
    GetPage(name: RouteNames.loginRoute, page: () => const LoginPage()),
  ];
}
