import 'package:hive/hive.dart';
import 'package:weather_app/features/forecast/domain/entities/forecast_table.dart';
import 'package:weather_app/features/forecast/domain/entities/current_weather_table.dart';

class ForecastLocalDataSource {
  final Box<ForecastTable> _forecastBox =
      Hive.box<ForecastTable>('forecastBox');
  final Box<CurrentWeatherTable> _currentWeatherBox =
      Hive.box<CurrentWeatherTable>('currentWeatherBox');

  Future<void> storeForecast(ForecastTable forecast) async {
    // Update the forecast if it already exists
    await _forecastBox.put(forecast.cod, forecast);
  }

  Future<ForecastTable?> retrieveForecast() async {
    return _forecastBox.get('forecast');
  }

  Future<void> storeCurrentWeather(CurrentWeatherTable currentWeather) async {
    // Update the current weather if it already exists
    await _currentWeatherBox.put(currentWeather.id, currentWeather);
  }

  Future<CurrentWeatherTable?> retrieveCurrentWeather() async {
    return _currentWeatherBox.get('currentWeather');
  }
}
