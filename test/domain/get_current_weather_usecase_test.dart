import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/common/failures.dart';
import 'package:weather_app/features/forecast/data/models/coordinates.dart';
import 'package:weather_app/features/forecast/data/models/current_weather.dart';
import 'package:weather_app/features/forecast/data/models/main.dart';
import 'package:weather_app/features/forecast/data/models/weather.dart';
import 'package:weather_app/features/forecast/data/models/wind.dart';
import 'package:weather_app/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:weather_app/features/forecast/domain/usecases/get_current_weather_usecase.dart';

import 'get_current_weather_usecase_test.mocks.dart';

@GenerateMocks([ForecastRepository])
void main() {
  late GetCurrentWeatherUsecase usecase;
  late MockForecastRepository mockRepository;

  setUp(() {
    mockRepository = MockForecastRepository();
    usecase = GetCurrentWeatherUsecase(mockRepository);
  });

  group('GetCurrentWeatherUsecase', () {
    const String city = "Nairobi";

    // Mock data for nested models
    final coordinates = Coordinates(lat: -1.2921, lon: 36.8219);
    final weatherList = [
      Weather(id: 1, main: "Clear", description: "clear sky", icon: "01d")
    ];
    final mainInfo = Main(
        temp: 25.0,
        pressure: 1012,
        humidity: 60,
        feelsLike: 25.0,
        tempMin: 24,
        tempMax: 26,
        seaLevel: 100,
        groundLevel: 150);
    final windInfo = Wind(speed: 4.5, deg: 90, gust: 10);

    // Complete CurrentWeather object
    final currentWeather = CurrentWeather(
      id: 1,
      name: city,
      cod: 200,
      coord: coordinates,
      weather: weatherList,
      base: "stations",
      main: mainInfo,
      visibility: 10000,
      wind: windInfo,
      dt: 1618317040.0,
    );

    test('should return CurrentWeather when the repository call is successful',
        () async {
      // Arrange
      when(mockRepository.getCurrentWeather(city))
          .thenAnswer((_) async => Right(currentWeather));

      // Act
      final result = await usecase(city);

      // Assert
      expect(result, Right(currentWeather));
      verify(mockRepository.getCurrentWeather(city)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return Failure when the repository call fails', () async {
      // Arrange
      when(mockRepository.getCurrentWeather(city))
          .thenAnswer((_) async => Left(ServerFailure()));

      // Act
      final result = await usecase(city);

      // Assert
      expect(result, Left(ServerFailure()));
      verify(mockRepository.getCurrentWeather(city)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
