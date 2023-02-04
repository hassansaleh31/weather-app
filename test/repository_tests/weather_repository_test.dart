import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app_demo/data_layer/dtos/current_weather_dto.dart';
import 'package:weather_app_demo/data_layer/providers/weather_provider.dart';
import 'package:weather_app_demo/data_layer/repositories/weather_repository.dart';
import 'package:weather_app_demo/domain_layer/models/clouds.dart';
import 'package:weather_app_demo/domain_layer/models/coordinates.dart';
import 'package:weather_app_demo/domain_layer/models/current_weather.dart';
import 'package:weather_app_demo/domain_layer/models/main_conditions.dart';
import 'package:weather_app_demo/domain_layer/models/rain.dart';
import 'package:weather_app_demo/domain_layer/models/snow.dart';
import 'package:weather_app_demo/domain_layer/models/weather_conditions.dart';
import 'package:weather_app_demo/domain_layer/models/wind.dart';

class MockWeatherProvider extends Mock implements WeatherProvider {}

late MockWeatherProvider _provider;
late WeatherRepository _repository;
final _coordinates = Coordinates(
  longitude: 10.99,
  latittude: 44.34,
);

final _dto = CurrentWeatherDTO.fromJson({
  "coord": {"lon": 10.99, "lat": 44.34},
  "weather": [
    {"id": 501, "main": "Rain", "description": "moderate rain", "icon": "10d"}
  ],
  "base": "stations",
  "main": {
    "temp": 298.48,
    "feels_like": 298.74,
    "temp_min": 297.56,
    "temp_max": 300.05,
    "pressure": 1015,
    "humidity": 64,
    "sea_level": 1015,
    "grnd_level": 933
  },
  "visibility": 10000,
  "wind": {"speed": 0.62, "deg": 349, "gust": 1.18},
  "rain": {"1h": 3.16},
  "clouds": {"all": 100},
  "dt": 1661870592,
  "sys": {
    "type": 2,
    "id": 2075663,
    "country": "IT",
    "sunrise": 1661834187,
    "sunset": 1661882248
  },
  "timezone": 7200,
  "id": 3163858,
  "name": "Zocca",
  "cod": 200
});

final response = CurrentWeather(
  coordinates: _coordinates,
  weather: [
    WeatherConditions(
      id: 501,
      category: WeatherCondition.rain,
      description: "moderate rain",
      icon: "10d",
    ),
  ],
  mainConditions: MainConditions(
    feelsLike: 298.74,
    temp: 298.48,
    tempMax: 300.05,
    tempMin: 297.56,
    pressure: 1015,
    humidity: 64,
    seaLevel: 1015,
    grndLevel: 933,
  ),
  visibility: 10000,
  wind: Wind(speed: 0.62, deg: 349, gust: 1.18),
  clouds: Clouds(all: 100),
  rain: Rain(oneHour: 3.16, threeHour: 0),
  snow: Snow(oneHour: 0, threeHour: 0),
  dateTime: DateTime.fromMillisecondsSinceEpoch(1661870592, isUtc: true),
  country: "IT",
  sunrise: DateTime.fromMillisecondsSinceEpoch(1661834187, isUtc: true),
  sunset: DateTime.fromMillisecondsSinceEpoch(1661882248, isUtc: true),
  timezone: 7200,
);

void main() {
  setUpAll(() {
    _provider = MockWeatherProvider();
    _repository = WeatherRepository(provider: _provider);

    when(
      () => _provider.getCurrentWeather(
        coordinates: _coordinates,
        forceRefresh: false,
      ),
    ).thenAnswer((invocation) async => _dto);
  });

  test('Should convert the weather DTO to a model', () async {
    final _weather = await _repository.getCurrentWeather(
      coordinates: _coordinates,
      forceRefresh: false,
    );

    expect(_weather, response);

    verify(
      () => _provider.getCurrentWeather(
        coordinates: _coordinates,
        forceRefresh: false,
      ),
    ).called(1);
  });
}
