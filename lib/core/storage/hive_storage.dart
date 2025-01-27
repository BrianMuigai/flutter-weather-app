import 'package:weather_app/features/forecast/domain/entities/city_table.dart';
import 'package:weather_app/features/forecast/domain/entities/coordinates_table.dart';
import 'package:weather_app/features/forecast/domain/entities/current_weather_table.dart';
import 'package:weather_app/features/forecast/domain/entities/forecast_table.dart';
import 'package:weather_app/features/forecast/domain/entities/main_table.dart';
import 'package:weather_app/features/forecast/domain/entities/weather_table.dart';
import 'package:weather_app/features/forecast/domain/entities/wind_table.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CityTableAdapter());
    Hive.registerAdapter(CoordinatesTableAdapter());
    Hive.registerAdapter(CurrentWeatherTableAdapter());
    Hive.registerAdapter(ForecastTableAdapter());
    Hive.registerAdapter(MainTableAdapter());
    Hive.registerAdapter(WeatherTableAdapter());
    Hive.registerAdapter(WindTableAdapter());

    await Hive.openBox<CityTable>('cityBox');
    await Hive.openBox<CoordinatesTable>('coordinatesBox');
    await Hive.openBox<CurrentWeatherTable>('currentWeatherBox');
    await Hive.openBox<ForecastTable>('forecastBox');
    await Hive.openBox<MainTable>('mainBox');
    await Hive.openBox<WeatherTable>('weatherBox');
    await Hive.openBox<WindTable>('windBox');
  }
}
