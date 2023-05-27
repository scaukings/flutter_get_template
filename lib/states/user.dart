import 'dart:convert';

import 'package:ai_device_app/common/api/profile.dart';
import 'package:ai_device_app/models/index.dart';
import 'package:ai_device_app/models/login.dart';
import 'package:get/get.dart';
import 'package:ai_device_app/services/storage.dart';
import 'package:ai_device_app/common/values/index.dart';

class UserState extends GetxController {
  static UserState get to => Get.find();
  // 用户登录信息
  final Rx<ProfileModel> _profile = ProfileModel().obs;
  // 是否登录
  final RxBool _logged = false.obs;
  bool get logged => _logged.value;
  // 登录token
  String token = '';

  @override
  void onInit() {
    // 获取token
    _getToken();
    // 获取用户信息
    _getProfile();
    super.onInit();
  }

  // 获取登录token
  _getToken() {
    token = StorageService.to.getString(StorageKey.token);
  }

  // 保存token
  _saveToken(String value) {
    token = value;
    StorageService.to.setString(StorageKey.token, value);
  }

  // 获取用户信息
  _getProfile() {
    String value = StorageService.to.getString(StorageKey.profile);
    if (value.isEmpty) {
      fetchUser();
      return;
    }
    try {
      _profile.value = ProfileModel.fromJson(jsonDecode(value));
      _logged.value = true;
    } catch (e) {
      _logged.value = false;
    }
  }

  // 保存用户信息
  _saveProfile(Map<String, dynamic> value) {
    _logged.value = true;
    _profile.value = ProfileModel.fromJson(value);
    StorageService.to.setString(StorageKey.profile, jsonEncode(value));
  }

  // 请求用户信息
  fetchUser() async {
    // 判断是否有token
    if (token.isEmpty) {
      return;
    }
    var res = await ProfileApi.userinfo();
    _profile.value = res;
  }

  // 用户登录
  login(LoginModel form) async {
    var res = await ProfileApi.login(form.toJson());
    // 保存token
    _saveToken(res['token']);
    // 保存用户信息
    _saveProfile(res['user']);
  }

  // 用户登出
  logout() {
    ProfileApi.logout().whenComplete(() {
      _logged.value = false;
      StorageService.to.remove(StorageKey.token);
      StorageService.to.remove(StorageKey.profile);
    });
  }
}
