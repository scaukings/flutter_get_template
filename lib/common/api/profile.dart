import 'package:ai_device_app/common/dio/index.dart';
import 'package:ai_device_app/models/index.dart';

class ProfileApi {
  // 登录
  static Future<Map<String, dynamic>> login(data) async {
    LoginRequest request = LoginRequest(data);
    return await fire(request);
  }

  // 获取用户信息
  static Future<ProfileModel> userinfo() async {
    UserRequest request = UserRequest();
    var res = await fire(request);
    return ProfileModel.fromJson(res);
  }

  // 退出登录
  static Future<dynamic> logout() async {
    LogoutRequest request = LogoutRequest();
    var res = await fire(request);
    return res;
  }
}
