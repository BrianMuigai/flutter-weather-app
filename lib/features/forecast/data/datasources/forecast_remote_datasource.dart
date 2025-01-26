import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/api_client/client_provider.dart';

@lazySingleton
class ForecastRemoteDatasource {
  final ClientProvider _provider;

  ForecastRemoteDatasource(this._provider);

  Future<dynamic> getCurrentWeather(String city) async {
    try {
      return await _provider.get(url: 'weather', query: {'q': city});
    } catch (e) {
      if (kDebugMode) {
        debugPrint('listHotels response: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> getForecast(String city) async {
    try {
      return await _provider.get(url: 'forecast', query: {'q': city});
    } catch (e) {
      if (kDebugMode) {
        debugPrint('listHotels response: $e');
      }
      rethrow;
    }
  }
}
