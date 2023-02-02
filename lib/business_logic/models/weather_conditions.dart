import 'package:equatable/equatable.dart';

/// The weather condition
class WeatherConditions extends Equatable {
  /// The id of the condition
  final String id;

  /// The main category of the condition
  final WeatherCondition category;

  /// The plain text description of the condition
  final String description;

  /// The icon of the condition
  final String icon;

  /// Creates a new [WeatherConditions].
  WeatherConditions({
    required this.id,
    required this.category,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        category,
        description,
        icon,
      ];

  /// Returns a copy of the weather conditions data modified by the provided
  /// data.
  WeatherConditions copyWith(
    String? id,
    WeatherCondition? category,
    String? description,
    String? icon,
  ) {
    return WeatherConditions(
      id: id ?? this.id,
      category: category ?? this.category,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}

/// Categories of weather conditions
enum WeatherCondition {
  /// Thunderstorm
  thunderStrom('Thunderstorm'),

  /// Drizzle
  drizzle('Drizzle'),

  /// Rain
  rain('Rain'),

  /// Snow
  snow('Snow'),

  /// Mist
  mist('Mist'),

  /// Smoke
  smoke('Smoke'),

  /// Haze
  haze('Haze'),

  /// Dust
  dust('Dust'),

  /// Fog
  fog('Fog'),

  /// Sand
  sand('Sand'),

  /// Ash
  ash('Ash'),

  /// Squall
  squal('Squall'),

  /// Tornado
  tornado('Tornado'),

  /// Clear
  clear('Clear'),

  /// Clouds
  clouds('Clouds'),

  /// Unknown
  unknown('Unknown');

  /// The string value of the condition
  final String value;

  /// Creates a new [WeatherCondition] instance
  const WeatherCondition(this.value);

  /// Returns the corresponding category based on the value
  static WeatherCondition getByValue(String value) {
    for (var condtion in WeatherCondition.values) {
      if (condtion.value == value) return condtion;
    }
    return WeatherCondition.unknown;
  }
}
