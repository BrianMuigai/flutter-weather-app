import 'package:dio/dio.dart';

class QueryInterceptor extends Interceptor {
  final String apiKey;
  final String lang;

  QueryInterceptor(this.apiKey, this.lang);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add the API key as a query parameter
    options.queryParameters['appid'] = apiKey;
    options.queryParameters['lang'] = lang;
    super.onRequest(options, handler);
  }
}
