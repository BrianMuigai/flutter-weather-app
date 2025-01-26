part of 'forecast_bloc.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends ForecastEvent {
  final String city;

  const FetchWeather({required this.city});
}

class FetchCurrentWeather extends ForecastEvent {
  final String city;

  const FetchCurrentWeather({required this.city});
}
