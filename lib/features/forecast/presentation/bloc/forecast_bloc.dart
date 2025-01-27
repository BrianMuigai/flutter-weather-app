import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/common/weather_utils.dart';
import 'package:weather_app/core/storage/shared_preferences_manager.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/data/models/forecast.dart';
import 'package:weather_app/features/forecast/data/models/forecast_item.dart';
import 'package:weather_app/features/forecast/domain/usecases/get_current_weather_usecase.dart';
import 'package:weather_app/features/forecast/domain/usecases/get_forecast_usecase.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

@Injectable()
class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetForecastUsecase _getForecastUsecase;
  final GetCurrentWeatherUsecase _getCurrentWeatherUsecase;
  final SharedPreferencesManager _preferencesManager;

  ForecastBloc(this._getForecastUsecase, this._getCurrentWeatherUsecase,
      this._preferencesManager)
      : super(ForecastInitial()) {
    on<FetchWeather>(_fetchWeather);
    on<FetchCurrentWeather>(_fetchCurrentWeather);
  }

  FutureOr<void> _fetchWeather(
      FetchWeather event, Emitter<ForecastState> emit) async {
    emit(ForecastLoading());
    final response = await _getForecastUsecase.call(event.city);
    emit(await response.fold(
      (err) => ForecastError(error: err.toString()),
      (forecasts) async {
        final viewHolders = await cleanForecast(forecasts.list);
        return ForecastLoaded(forecasts: forecasts, viewHolders: viewHolders);
      },
    ));
  }

  FutureOr<void> _fetchCurrentWeather(
      FetchCurrentWeather event, Emitter<ForecastState> emit) async {
    emit(ForecastLoading());
    final response = await _getCurrentWeatherUsecase.call(event.city);
    emit(response.fold(
      (error) => CurrentWeatherError(error: error.toString()),
      (current) {
        int? milliseconds =
            _preferencesManager.getInt(SharedPreferencesManager.lastUpdated);
        String? lastUpdated;
        if (milliseconds != null) {
          lastUpdated = timeAgo(milliseconds);
        }
        return CurrentWeatherLoaded(weather: current, lastUpdated: lastUpdated);
      },
    ));
  }

  Future<List<ForecastHolder>> cleanForecast(List<ForecastItem> data) async {
    final List<ForecastHolder> newData = [];
    final Set<String> weekDaysSet = {};

    double total = 0.0;
    int count = 0;

    for (final ForecastItem item in data) {
      final String dayOfWeek = getDayOfWeek(item.dt);
      if (weekDaysSet.contains(dayOfWeek)) {
        total += item.main.temp;
        count++;
      } else {
        if (total != 0.0) {
          newData.add(
            ForecastHolder(
              dayOfWeek: dayOfWeek,
              icon: getIcon(item.weather.first.description, false),
              avgTemp: (total / count).ceil(),
            ),
          );
        }
        total = item.main.temp;
        count = 1;
        weekDaysSet.add(dayOfWeek);
      }
    }

    return newData;
  }
}
