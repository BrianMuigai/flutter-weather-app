import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:weather_app/core/storage/shared_preferences_manager.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/data/models/forecast.dart';

@lazySingleton
class ForecastLocalDataSource {
  final SharedPreferencesManager _preferencesManager;

  ForecastLocalDataSource(this._preferencesManager);

  Future<void> storeForecast(Forecast forecast) async {
    await _preferencesManager.putString(
        SharedPreferencesManager.forecast, jsonEncode(forecast.toJson()));
  }

  Future<Forecast?> retrieveForecast() async {
    final forecastJsonString =
        _preferencesManager.getString(SharedPreferencesManager.forecast);
    if (forecastJsonString == null) return null;

    return Forecast.fromJson(jsonDecode(forecastJsonString));
  }

  Future<void> storeCurrentWeather(CurrentWeather currentWeather) async {
    await _preferencesManager.putString(SharedPreferencesManager.currentWeather,
        jsonEncode(currentWeather.toJson()));
  }

  Future<CurrentWeather?> retrieveCurrentWeather() async {
    final currentJsonString =
        _preferencesManager.getString(SharedPreferencesManager.currentWeather);
    if (currentJsonString == null) return null;
    return CurrentWeather.fromJson(jsonDecode(currentJsonString));
  }

  Future<void> storeLastUpdated() async {
    await _preferencesManager.putInt(SharedPreferencesManager.lastUpdated,
        DateTime.now().millisecondsSinceEpoch);
  }
}
