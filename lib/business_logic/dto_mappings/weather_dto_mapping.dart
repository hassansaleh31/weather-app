import '../dtos/wather_conditions_dto.dart';
import '../models/weather_conditions.dart';

/// Extension that provides mappings for [WeatherConditionsDTO]
extension WeatherDTOMapping on WeatherConditionsDTO {
  /// Maps into a [WeatherConditions]
  WeatherConditions toWeatherConditions() {
    return WeatherConditions(
      id: id ?? 0,
      category: WeatherCondition.getByValue(main),
      description: description ?? '',
      icon: icon,
    );
  }
}
