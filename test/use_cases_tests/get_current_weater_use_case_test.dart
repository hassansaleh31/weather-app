import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_demo/data_layer/repositories/weather_repository.dart';
import 'package:weather_app_demo/domain_layer/models/clouds.dart';
import 'package:weather_app_demo/domain_layer/models/coordinates.dart';
import 'package:weather_app_demo/domain_layer/models/current_weather.dart';
import 'package:weather_app_demo/domain_layer/models/main_conditions.dart';
import 'package:weather_app_demo/domain_layer/models/rain.dart';
import 'package:weather_app_demo/domain_layer/models/snow.dart';
import 'package:weather_app_demo/domain_layer/models/weather_conditions.dart';
import 'package:weather_app_demo/domain_layer/models/wind.dart';
import 'package:weather_app_demo/domain_layer/use_cases/get_current_weather_use_case.dart';

class WeatherRepositoryMock extends Mock implements WeatherRepository {}

late WeatherRepositoryMock _repository;
late GetCurrentWeatherUseCase _useCase;
late DateTime _currentDate;

final response = CurrentWeather(
  coordinates: Coordinates(
    longitude: 10.99,
    latittude: 44.34,
  ),
  weather: [
    WeatherConditions(
      id: 1,
      category: WeatherCondition.clear,
      description: "description",
    ),
  ],
  mainConditions: MainConditions(
    feelsLike: 1,
    temp: 2,
    tempMax: 3,
    tempMin: 4,
    pressure: 5,
    humidity: 6,
    seaLevel: 7,
    grndLevel: 8,
  ),
  visibility: 9,
  wind: Wind(speed: 10, deg: 11, gust: 12),
  clouds: Clouds(all: 13),
  rain: Rain(oneHour: 14, threeHour: 15),
  snow: Snow(oneHour: 16, threeHour: 17),
  dateTime: _currentDate,
  country: "LB",
  sunrise: 18,
  sunset: 19,
  timezone: 20,
);

void main() {
  setUpAll(() {
    _repository = WeatherRepositoryMock();
    _useCase = GetCurrentWeatherUseCase(repository: _repository);
    _currentDate = DateTime.now();

    when(() => _repository.getCurrentWeather(
          coordinates: Coordinates(
            longitude: 10.99,
            latittude: 44.34,
          ),
        )).thenAnswer((invocation) async => response);
  });

  test("Should get current weather", () async {
    final weather = await _useCase(
      coordinates: Coordinates(
        longitude: 10.99,
        latittude: 44.34,
      ),
    );

    expect(weather, response);
    verify(() => _repository.getCurrentWeather(
          coordinates: Coordinates(
            longitude: 10.99,
            latittude: 44.34,
          ),
        )).called(1);
  });
}
