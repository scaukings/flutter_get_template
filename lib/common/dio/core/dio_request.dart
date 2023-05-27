import 'dart:io';

enum HttpMethod { get, post, put, delete }

abstract class DioRequest<T> {
  DioRequest({this.parameter, this.data}) : super();
  // 请求地址
  String get authority {
    String? env = Platform.environment['ENV'];
    print('环境变量：$env');
    // 根据环境变量来返回请求地址
    return 'mock.apifox.cn/m1/2771378-0-default';
  }

  // 请求路径
  String get path;
  // 请求方式
  HttpMethod get method => HttpMethod.get;
  // 是否需要登录
  bool get needLogin => false;
  // 请求参数
  final Map<String, dynamic>? parameter;
  // 请求数据
  final Object? data;
  // 请求头
  Map<String, dynamic> getHeader() {
    Map<String, dynamic> header = {};
    if (needLogin) {
      header['token'] = '';
    }
    return header;
  }

  // 完整的请求地址
  String url() {
    if (method == HttpMethod.get) {
      return Uri.http(authority, path, parameter).toString();
    }
    return Uri.https(authority, path).toString();
  }

  // 是否提示错误
  bool get tipErr => true;
}
