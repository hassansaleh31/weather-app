import './clouds_dto_mapping.dart';
import './coordinates_dto_mapping.dart';
import './main_conditions_dto_mapping.dart';
import './rain_dto_mapping.dart';
import './snow_dto_mapping.dart';
import './weather_dto_mapping.dart';
import './wind_dto_mapping.dart';
import '../dtos/current_weather_dto.dart';
import '../models/clouds.dart';
import '../models/coordinates.dart';
import '../models/current_weather.dart';
import '../models/main_conditions.dart';
import '../models/rain.dart';
import '../models/snow.dart';
import '../models/weather_conditions.dart';
import '../models/wind.dart';
import '../networking/json_parser.dart';

/// Extension that provides mappings for [CurrentWeatherDTO]
extension CurrentWeatherDTOMapping on CurrentWeatherDTO {
  /// Maps into a [CurrentWeather]
  CurrentWeather toCurrentWeather() {
    return CurrentWeather(
      coordinates: coordinates?.toCoordinates() ??
          Coordinates(
            longitude: 0,
            latittude: 0,
          ),
      weather: weather?.toWeatherConditions() ??
          WeatherConditions(
            id: 0,
            category: WeatherCondition.unknown,
            description: '',
          ),
      mainConditions: mainConditions?.toMainConditions() ??
          MainConditions(
            temp: 0,
            feelsLike: 0,
            tempMin: 0,
            tempMax: 0,
            pressure: 0,
            humidity: 0,
            seaLevel: 0,
            grndLevel: 0,
          ),
      visibility: visibility ?? 0,
      wind: wind?.toWind() ??
          Wind(
            speed: 0,
            deg: 0,
            gust: 0,
          ),
      clouds: clouds?.toClouds() ??
          Clouds(
            all: 0,
          ),
      rain: rain?.toRain() ??
          Rain(
            oneHour: 0,
            threeHour: 0,
          ),
      snow: snow?.toSnow() ??
          Snow(
            oneHour: 0,
            threeHour: 0,
          ),
      dateTime: parseDate(dateTime) ?? DateTime.now(),
      country: country ?? '',
      sunrise: sunrise ?? 0,
      sunset: sunset ?? 0,
      timezone: timezone ?? 0,
    );
  }
}
