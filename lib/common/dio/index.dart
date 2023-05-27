library dio;

import 'core/dio_net.dart';
import 'core/dio_request.dart';

export 'request/index.dart';

Future<dynamic> fire(DioRequest request) async {
  return DioNet.getInstance().fire(request);
}
