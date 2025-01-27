part of 'forecast_bloc.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();

  @override
  List<Object> get props => [];
}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final Forecast forecasts;
  final List<ForecastHolder> viewHolders;

  const ForecastLoaded({required this.forecasts, required this.viewHolders});
}

class ForecastError extends ForecastState {
  final String error;

  const ForecastError({required this.error});
}

class CurrentWeatherError extends ForecastState {
  final String error;

  const CurrentWeatherError({required this.error});
}

class CurrentWeatherLoaded extends ForecastState {
  final CurrentWeather weather;
  final String? lastUpdated;

  const CurrentWeatherLoaded(
      {required this.weather, required this.lastUpdated});
}
