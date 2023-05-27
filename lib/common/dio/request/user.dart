import 'package:ai_device_app/common/dio/core/dio_request.dart';

// 登录请求
class LoginRequest extends DioRequest {
  LoginRequest(data) : super(data: data);
  // 请求路径
  @override
  String get path => '/api/login';
  // 是否需要登录
  @override
  bool get needLogin => false;
}

// 退出登录
class LogoutRequest extends DioRequest {
  @override
  String get path => '/api/lgout';
}

// 用户信息
class UserRequest extends DioRequest {
  @override
  String get path => '/api/user/info';
}
