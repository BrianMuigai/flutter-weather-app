import 'package:dio/dio.dart';

class QueryInterceptor extends Interceptor {
  final String apiKey;
  final String lang;
  final String units;

  QueryInterceptor(this.apiKey, this.lang, this.units);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add the API key as a query parameter
    options.queryParameters['appid'] = apiKey;
    options.queryParameters['lang'] = lang;
    options.queryParameters['units'] = units;
    super.onRequest(options, handler);
  }
}
