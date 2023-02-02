import '../dto_mappings/current_weather_dto_mapping.dart';
import '../models/coordinates.dart';
import '../models/current_weather.dart';
import '../providers/weather_provider.dart';

/// A repository that can be used to fetch weather data
class WeatherRepository {
  final WeatherProvider _provider;

  /// Creates a new [WeatherRepository] with the supplied provider.
  WeatherRepository({
    required WeatherProvider provider,
  }) : _provider = provider;

  /// Fetches the current weather
  Future<CurrentWeather> getCurrentWeather({
    required Coordinates coordinates,
    bool forceRefresh = false,
  }) async {
    final dto = await _provider.getCurrentWeather(
      coordinates: coordinates,
      forceRefresh: forceRefresh,
    );

    return dto.toCurrentWeather();
  }
}
