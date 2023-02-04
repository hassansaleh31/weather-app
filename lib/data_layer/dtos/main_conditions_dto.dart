import '../networking/json_parser.dart';

/// A data structure object representing the main weather condition values
class MainConditionsDTO {
  /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double? temp;

  /// Temperature. This temperature parameter accounts for the human perception
  /// of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double? feelsLike;

  /// Minimum temperature at the moment. This is minimal currently observed
  /// temperature (within large megalopolises and urban areas). Unit Default:
  /// Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double? tempMin;

  /// Maximum temperature at the moment. This is maximal currently observed
  /// temperature (within large megalopolises and urban areas). Unit Default:
  /// Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double? tempMax;

  /// Atmospheric pressure (on the sea level, if there is no sea_level or
  /// grnd_level data), hPa
  final double? pressure;

  /// Humidity, %
  final double? humidity;

  /// Atmospheric pressure on the sea level, hPa
  final double? seaLevel;

  ///  Atmospheric pressure on the ground level, hPa
  final double? grndLevel;

  /// Creates a new [MainConditionsDTO].
  MainConditionsDTO({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  /// Creates a [MainConditionsDTO] from the supplied JSON object
  factory MainConditionsDTO.fromJson(Map<String, dynamic>? json) {
    return MainConditionsDTO(
      temp: parseDouble(json?['temp']),
      feelsLike: parseDouble(json?['feels_like']),
      tempMin: parseDouble(json?['temp_min']),
      tempMax: parseDouble(json?['temp_max']),
      pressure: parseDouble(json?['pressure']),
      humidity: parseDouble(json?['humidity']),
      seaLevel: parseDouble(json?['sea_level']),
      grndLevel: parseDouble(json?['grnd_level']),
    );
  }
}
