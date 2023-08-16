import 'package:dio/dio.dart';

import '../utils/string.dart';

class VulteInterceptor extends Interceptor {
  VulteInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Logger('options.methodInter-- ${options.method}');

    Logger('Logger-.options.baseUrl--- ${options.baseUrl}');
    Logger('Logger-.options.path--- ${options.path}');
    Logger('options.method-- ${options.method}');
    Logger('options.method-- ${options.data}');
    Logger('Logger-.options.headers-- ${options.headers}');
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger('DioException--data ${err.response!.data}');
    Logger('DioException--.statusCode ${err.response!.statusCode}');
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger('Logger-response.data--- ${response.data}');

    Logger('Logger-response.statusCode--- ${response.statusCode}');
    return handler.next(response);
  }
}
