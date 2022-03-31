import 'package:dio/dio.dart';

var baseUrl = 'http://101.42.134.18:8000';
var timeout = 5000;

class HttpRequest {
  // 1.创建实例对象
  static BaseOptions baseOptions =
      BaseOptions(baseUrl: baseUrl, connectTimeout: timeout);
  static Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get", Map<String, dynamic>? params}) async {
    // 1.单独相关的设置
    Options options = Options(method: method);
    // 2.发送网络请求
    try {
      Response response =
          await dio.request<T>(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      throw e;
    }
  }
}
