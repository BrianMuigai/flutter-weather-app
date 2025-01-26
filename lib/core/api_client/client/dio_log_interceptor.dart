// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioLogInterceptors extends Interceptor {
  bool? printBody;

  DioLogInterceptors({this.printBody});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint(
        "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    if (options.data != null && (printBody ?? false)) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint("--> END ${options.method.toUpperCase()}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "<-- ${response.statusCode} ${((response.requestOptions.baseUrl + response.requestOptions.path))}");
    debugPrint("Headers:");
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    if (printBody ?? false) {
      // log("Response: ${response.data}");
      debugPrint('Response: ${response.data}');
    }
    debugPrint("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        "<-- ERRR ${err.message} ${(err.response?.requestOptions != null ? ("${err.response?.requestOptions.baseUrl}${err.response?.requestOptions.path}") : 'URL')}");
    debugPrint(
        "${err.response != null ? err.response?.data : 'Unknown Error'}");
    debugPrint("<-- End error");
    return super.onError(err, handler);
  }
}
