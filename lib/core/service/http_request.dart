import 'package:dio/dio.dart';

import 'config.dart';

class Http {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl, connectTimeout: HttpConfig.timeOut);
  static final Dio mDio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic>? params,
      Interceptor? interceptor}) async {
    //1.创建单独的配置
    final options = Options(method: method);

    //全局拦截器
    //创建默认的 全局拦截器
    Interceptor defInterceptro = InterceptorsWrapper(
        //请求时的拦截
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) {
              print("http request: url = ${options.uri}");
            },

        //响应时的拦截
        onResponse: (Response resp, ResponseInterceptorHandler handler) {

        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
        });

    List<Interceptor> interceptors = [defInterceptro];
    if(interceptor != null) {
      interceptors.add(interceptor);
    }
    //2.发送网络请求
    try {
      Response response =
          await mDio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
