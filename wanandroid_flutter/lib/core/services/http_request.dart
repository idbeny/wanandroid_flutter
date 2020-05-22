import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Dio网络请求封装
class HttpRequest {
  // 基础配置（域名、超时...）
  static const String baseURL = "https://www.wanandroid.com";
  static const int timeout = 5000;
  static final BaseOptions baseOptions = BaseOptions(baseUrl: baseURL, connectTimeout: timeout);
  // 创建dio对象
  static final Dio dio = Dio(baseOptions);
  // 构造请求
  static Future<T> request<T>({
                  @required String url,
                  String method = "get",
                  Map<String, dynamic> params,
                  Interceptor interceptor}) async {
    // 请求方式（get、post...）
    final Options options = Options(method: method);
    // 拦截器（全局）
    Interceptor defaultInterceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print("拦截请求：${options.uri}");
        return options;
      },
      onResponse: (Response response) {
        print("拦截响应：${response.data}");
        return response;
      },
      onError: (DioError error) {
        print("请求错误：${error.error}");
        return error;
      }
    );
    List<Interceptor> interceptors = [defaultInterceptor];
    // 具体请求的拦截器
    if (interceptor != null) {
      interceptors.add(interceptor);
    }
    dio.interceptors.addAll(interceptors);

    // 发起请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(error) {
      return Future.error(error);
    }
  }
}
