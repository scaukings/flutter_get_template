class DioErr implements Exception {
  DioErr({this.status = 500, this.message = '请求时发生错误'});
  int? status;
  String? message;
}

// 未登录
class NeedLogin extends DioErr {
  NeedLogin({
    int status = 401,
    message = '请先登录',
  }) : super(status: status, message: message);
}

// 没有权限
class NeedAuth extends DioErr {
  NeedAuth({
    int status = 403,
    String message = '无访问权限',
  }) : super(status: status, message: message);
}

// 访问的接口不存在
class NotFound extends DioErr {
  NotFound({
    int status = 404,
    String message = '访问的地址不存在',
  }) : super(status: status, message: message);
}
