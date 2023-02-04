import './clouds_dto_mapping.dart';
import './coordinates_dto_mapping.dart';
import './main_conditions_dto_mapping.dart';
import './rain_dto_mapping.dart';
import './snow_dto_mapping.dart';
import './weather_dto_mapping.dart';
import './wind_dto_mapping.dart';
import '../../data_layer/dtos/current_weather_dto.dart';
import '../../domain_layer/models/clouds.dart';
import '../../domain_layer/models/coordinates.dart';
import '../../domain_layer/models/current_weather.dart';
import '../../domain_layer/models/main_conditions.dart';
import '../../domain_layer/models/rain.dart';
import '../../domain_layer/models/snow.dart';
import '../../domain_layer/models/wind.dart';
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
      weather: weather
              ?.map((e) => e.toWeatherConditions())
              .toList(growable: false) ??
          [],
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
      dateTime: parseDate(dateTime, isUTC: true) ?? DateTime.now(),
      country: country ?? '',
      sunrise: parseDate(sunrise, isUTC: true) ?? DateTime.now(),
      sunset: parseDate(sunset, isUTC: true) ?? DateTime.now(),
      timezone: timezone ?? 0,
    );
  }
}
