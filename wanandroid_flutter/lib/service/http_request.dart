import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'http_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeout);

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>({
                  @required String url,
                  String method = "get",
                  Map<String, dynamic> params,
                  Interceptor interceptor}) async {
    final Options options = Options(method: method);

    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        return options;
      },
      onResponse: (Response response) {
        return response;
      },
      onError: (DioError error) {
        return error;
      }
    );
    List<Interceptor> interceptors = [defaultInterceptor];

    if (interceptor != null) {
      interceptors.add(interceptor);
    }

    dio.interceptors.addAll(interceptors);

    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(error) {
      return Future.error(error);
    }
  }
}
