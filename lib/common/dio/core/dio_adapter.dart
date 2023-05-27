import 'package:dio/dio.dart';

import 'dio_err.dart';
import 'dio_request.dart';

class DioAdapter {
  Future<T?> send<T>(DioRequest request) async {
    Dio dio = Dio();
    // 连接超时
    dio.options.connectTimeout = const Duration(seconds: 6);
    // 返回超时
    dio.options.receiveTimeout = const Duration(seconds: 6);
    try {
      T res;
      switch (request.method) {
        case HttpMethod.get:
          res = await _get<T>(dio, request);
          break;
        case HttpMethod.post:
          res = await _post<T>(dio, request);
          break;
        case HttpMethod.put:
          res = await _put<T>(dio, request);
          break;
        case HttpMethod.delete:
          res = await _delete<T>(dio, request);
          break;
      }
      dio.close();
      return res;
    } catch (e) {
      rethrow;
    }
  }

  // get请求
  Future<T> _get<T>(Dio dio, DioRequest request) async {
    Response res = await dio.get(request.url());
    return _buildRespose(res);
  }

  // post请求
  Future<T> _post<T>(Dio dio, DioRequest request) async {
    Response res = await dio.post(
      request.url(),
      data: request.data,
      queryParameters: request.parameter,
    );
    return _buildRespose(res);
  }

  // put请求
  Future<T> _put<T>(Dio dio, DioRequest request) async {
    Response res = await dio.put(
      request.url(),
      data: request.data,
      queryParameters: request.parameter,
    );
    return _buildRespose(res);
  }

  // put请求
  Future<T> _delete<T>(Dio dio, DioRequest request) async {
    Response res = await dio.delete(
      request.url(),
      data: request.data,
      queryParameters: request.parameter,
    );
    return _buildRespose(res);
  }

  // 处理返回结果
  _buildRespose(Response response) async {
    int? statusCode = response.statusCode;
    if (statusCode == 200) {
      Map<String, dynamic>? data = response.data;
      // 请求失败
      if (data == null) {
        throw DioErr(message: '接口未返回任何数据');
      }
      // 状态码
      int? status = data['status'];
      // 请求成功
      if (status == 200) {
        return data['data'];
      } else if (status == 401) {
        throw NeedLogin();
      } else if (status == 403) {
        throw NeedAuth();
      } else {
        throw DioErr(status: status ?? 500, message: data['msg']);
      }
    } else {
      throw DioErr(status: statusCode, message: response.statusMessage);
    }
  }
}
