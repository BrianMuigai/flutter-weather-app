import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/api_client/client/query_interceptor.dart';
import 'package:weather_app/core/api_client/client/dio_log_interceptor.dart';
import 'package:weather_app/core/storage/shared_preferences_manager.dart';

@lazySingleton
class DioClient {
  final Options open = Options(headers: {'Content-Type': 'application/json'});
  final Dio dio;
  final String _apiKey;
  final SharedPreferencesManager _preferencesManager;

  DioClient(this.dio, this._preferencesManager, @Named('ApiKey') this._apiKey) {
    dio.interceptors.add(DioLogInterceptors(printBody: kDebugMode));
    dio.interceptors.add(QueryInterceptor(
        _apiKey,
        _preferencesManager.getString(SharedPreferencesManager.language) ??
            'en'));
  }

  DioClient getInstance() => this;
}
