import '../networking/json_parser.dart';

/// A data structure object representing the weather condition
class WeatherConditionsDTO {
  /// The id of the condition
  final int? id;

  /// The main category of the condition
  final String? main;

  /// The plain text description of the condition
  final String? description;

  /// The icon of the condition
  final String? icon;

  /// Creates a new [WeatherConditionsDTO].
  WeatherConditionsDTO({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  /// Creates a [WeatherConditionsDTO] from the supplied JSON object
  factory WeatherConditionsDTO.fromJson(Map<String, dynamic> json) {
    return WeatherConditionsDTO(
      id: parseInt(json['id']),
      main: parseString(json['main']),
      description: parseString(json['description']),
      icon: parseString(json['icon']),
    );
  }
}
