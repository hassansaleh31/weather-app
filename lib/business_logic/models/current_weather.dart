import 'package:equatable/equatable.dart';

import 'clouds.dart';
import 'coordinates.dart';
import 'main_conditions.dart';
import 'rain.dart';
import 'snow.dart';
import 'weather_conditions.dart';
import 'wind.dart';

/// The current weather data
class CurrentWeather extends Equatable {
  /// The coordinates of the current weather
  final Coordinates coordinates;

  /// Describes the general weather conditions
  final WeatherConditions weather;

  /// The main weather conditions
  final MainConditions mainConditions;

  /// Visibility in meter. The maximum value of the visibility is 10km
  final int visibility;

  /// The wind conditions
  final Wind wind;

  /// The clouds condition
  final Clouds clouds;

  /// Rain conditions
  final Rain rain;

  /// Snow conditions
  final Snow snow;

  ///  Time of data calculation, unix, UTC
  final DateTime dateTime;

  ///  Country code (GB, JP etc.)
  final String country;

  /// Sunrise time, unix, UTC
  final int sunrise;

  /// Sunset time, unix, UTC
  final int sunset;

  /// Shift in seconds from UTC
  final int timezone;

  /// Creates a new [CurrentWeather] Instance
  CurrentWeather({
    required this.coordinates,
    required this.weather,
    required this.mainConditions,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.rain,
    required this.snow,
    required this.dateTime,
    required this.country,
    required this.sunrise,
    required this.sunset,
    required this.timezone,
  });

  @override
  List<Object?> get props => [
        coordinates,
        weather,
        mainConditions,
        visibility,
        wind,
        clouds,
        rain,
        snow,
        dateTime,
        country,
        sunrise,
        sunset,
        timezone,
      ];

  /// Returns a copy of the current weather data modified by the provided data.
  CurrentWeather copyWith(
    Coordinates? coordinates,
    WeatherConditions? weather,
    MainConditions? mainConditions,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    Rain? rain,
    Snow? snow,
    DateTime? dateTime,
    String? country,
    int? sunrise,
    int? sunset,
    int? timezone,
  ) {
    return CurrentWeather(
      coordinates: coordinates ?? this.coordinates,
      weather: weather ?? this.weather,
      mainConditions: mainConditions ?? this.mainConditions,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      dateTime: dateTime ?? this.dateTime,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      timezone: timezone ?? this.timezone,
    );
  }
}
