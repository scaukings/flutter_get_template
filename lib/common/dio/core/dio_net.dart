import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'dio_adapter.dart';
import 'dio_request.dart';

class DioNet {
  DioNet._();
  static DioNet? _instance;
  // 获取实例
  static DioNet getInstance() {
    _instance ??= DioNet._();
    return _instance!;
  }

  // 发送请求
  Future<T> fire<T>(DioRequest request) async {
    try {
      return await _send(request);
    } catch (e) {
      if (request.tipErr) {
        EasyLoading.showToast('');
      }
      rethrow;
    }
  }

  // 发送数据
  Future _send(DioRequest request) async {
    DioAdapter adapter = DioAdapter();
    return adapter.send(request);
  }
}
