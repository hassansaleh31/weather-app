import 'package:equatable/equatable.dart';

/// The main weather condition
class MainConditions extends Equatable {
  /// Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double temp;

  /// Temperature. This temperature parameter accounts for the human perception
  /// of weather. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double feelsLike;

  /// Minimum temperature at the moment. This is minimal currently observed
  /// temperature (within large megalopolises and urban areas). Unit Default:
  /// Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double tempMin;

  /// Maximum temperature at the moment. This is maximal currently observed
  /// temperature (within large megalopolises and urban areas). Unit Default:
  /// Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  final double tempMax;

  /// Atmospheric pressure (on the sea level, if there is no sea_level or
  /// grnd_level data), hPa
  final double pressure;

  /// Humidity, %
  final double humidity;

  /// Atmospheric pressure on the sea level, hPa
  final double seaLevel;

  ///  Atmospheric pressure on the ground level, hPa
  final double grndLevel;

  /// Creates a new [MainConditions] Instance
  MainConditions({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];

  /// Returns a copy of the main conditions data modified by the provided data.
  MainConditions copyWith(
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    double? pressure,
    double? humidity,
    double? seaLevel,
    double? grndLevel,
  ) {
    return MainConditions(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }
}
