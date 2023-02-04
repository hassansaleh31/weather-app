import '../networking/json_parser.dart';
import 'clouds_dto.dart';
import 'coordinates_dto.dart';
import 'main_conditions_dto.dart';
import 'rain_dto.dart';
import 'snow_dto.dart';
import 'wather_conditions_dto.dart';
import 'wind_dto.dart';

/// A data structure object representing the current weather
class CurrentWeatherDTO {
  /// The coordinates of the current weather
  final CoordinatesDTO? coordinates;

  /// Describes the general weather conditions
  final List<WeatherConditionsDTO>? weather;

  /// The main weather conditions
  final MainConditionsDTO? mainConditions;

  /// Visibility in meter. The maximum value of the visibility is 10km
  final int? visibility;

  /// The wind conditions
  final WindDTO? wind;

  /// The clouds condition
  final CloudsDTO? clouds;

  /// Rain conditions
  final RainDTO? rain;

  /// Snow conditions
  final SnowDTO? snow;

  ///  Time of data calculation, unix, UTC
  final int? dateTime;

  ///  Country code (GB, JP etc.)
  final String? country;

  /// Sunrise time, unix, UTC
  final int? sunrise;

  /// Sunset time, unix, UTC
  final int? sunset;

  /// Shift in seconds from UTC
  final int? timezone;

  /// Creates a new [CurrentWeatherDTO].
  CurrentWeatherDTO({
    this.coordinates,
    this.weather,
    this.mainConditions,
    this.visibility,
    this.wind,
    this.clouds,
    this.rain,
    this.snow,
    this.dateTime,
    this.country,
    this.sunrise,
    this.sunset,
    this.timezone,
  });

  /// Creates a [CurrentWeatherDTO] from the supplied JSON object
  factory CurrentWeatherDTO.fromJson(Map<String, dynamic>? json) {
    return CurrentWeatherDTO(
      coordinates: CoordinatesDTO.fromJson(json?['coord']),
      weather: WeatherConditionsDTO.fromJsonList(json?['weather']),
      mainConditions: MainConditionsDTO.fromJson(json?['main']),
      visibility: parseInt(json?['visibility']),
      wind: WindDTO.fromJson(json?['wind']),
      clouds: CloudsDTO.fromJson(json?['clouds']),
      rain: RainDTO.fromJson(json?['rain']),
      snow: SnowDTO.fromJson(json?['snow']),
      dateTime: parseInt(json?['dt']),
      country: parseString(json?['sys']?['country']),
      sunrise: parseInt(json?['sys']?['sunrise']),
      sunset: parseInt(json?['sys']?['sunset']),
      timezone: parseInt(json?['timezone']),
    );
  }
}
